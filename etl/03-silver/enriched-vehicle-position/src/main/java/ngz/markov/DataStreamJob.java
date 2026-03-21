package ngz.markov ;

import java.time.Duration;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.datastream.KeyedStream;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.util.ParameterTool;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.gtfs.base.model.Route;
import ngz.markov.gtfs.rt.mapper.EnrichedVehiclePositionMapper;
import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.processfunctions.EnrichmentCoprocessFunction;
import ngz.markov.processfunctions.RouteKeySelector;
import ngz.markov.processfunctions.ValidationVehiclePositionProcessFunction;
import ngz.markov.processfunctions.VehiclePositionKeySelector;
import ngz.markov.quality.model.InvalidRecord;
import ngz.markov.sinks.EnrichedVehiclePositionSinkFactory;
import ngz.markov.sinks.InvalidVehiclePositionSinkFactory;
import ngz.markov.sources.CDCEventRouteSourceFactory;
import ngz.markov.sources.VehiclePositionSourceFactory;


public class DataStreamJob {

	public static void main(String[] args) throws Exception {
		// Sets up the execution environment, which is the main entry point
		// to building Flink applications.
		final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

		// Load configuration
		ParameterTool parameters =  ParameterTool.fromArgs(args);
		
		String kafkaBootstrapServers = parameters.getRequired("kafka.bootstrap.servers");
		String kafkaSourceTopic = parameters.getRequired("kafka.source.topic");
		String kafkaEnrichmentTopic =  parameters.getRequired("kafka.enrichment.topic") ;
		String kafkaSourceGroupId =  parameters.getRequired("kafka.source.groupId");
		String kafkaSinkTopic =  parameters.getRequired("kafka.sink.topic") ;
		String kafkaSinkSideOutputTopic =  parameters.getRequired("kafka.sink.topic.validationerrors");

		env.getConfig().setGlobalJobParameters(parameters);

		// 1. Sources

		// 1.1 Enrichment Route data stream 

		WatermarkStrategy<CDCEvent<Route>> routeWm =
			WatermarkStrategy
				.<CDCEvent<Route>>forBoundedOutOfOrderness(Duration.ofSeconds(10))
				.withTimestampAssigner((event, ts) -> event.getRecordTimestamp())
				.withIdleness(Duration.ofMinutes(1));

		DataStreamSource<CDCEvent<Route>> bronzeRouteStream =  env.fromSource(
			CDCEventRouteSourceFactory.createSource(
				kafkaBootstrapServers,
				kafkaSourceGroupId,
				kafkaEnrichmentTopic
			), 
			routeWm, 
		"CDCEventRouteSource") ; 



		// 1.2 Bronze Vehicle Position 
		KafkaSource<VehiclePosition> bronzeVehiclePosition = VehiclePositionSourceFactory.createSource(
			kafkaBootstrapServers,
			kafkaSourceGroupId,
			kafkaSourceTopic
		) ; 

		WatermarkStrategy<VehiclePosition> vehicleWm =
			WatermarkStrategy
				.<VehiclePosition>forBoundedOutOfOrderness(Duration.ofSeconds(10))
				.withTimestampAssigner((event, ts) -> event.getTimestamp())
				.withIdleness(Duration.ofMinutes(2));


		// 2. Process the 2 streams 

		// 2.1 Route stream  
		KeyedStream<CDCEvent<Route>, String> keyedRouteStream= bronzeRouteStream
			.keyBy(new RouteKeySelector());

		// 2.2 Vehicle Position : Filter and prepare 
		ValidationVehiclePositionProcessFunction validateFunction = new ValidationVehiclePositionProcessFunction() ; 
		SingleOutputStreamOperator<VehiclePosition> cleanedVehiclePositionStream  =  env.fromSource(
				bronzeVehiclePosition, 
				vehicleWm, 
				"Gtfs Vehicle Position")
				.process(validateFunction)
				.uid("ValidationVehiclePositionProcessFunction")
			;

		KeyedStream<EnrichedVehiclePosition, String> keyedVehiclePositionStream = 
			cleanedVehiclePositionStream
				.map(vehiclePosition -> EnrichedVehiclePositionMapper.fromSuper(vehiclePosition))
				.keyBy(new VehiclePositionKeySelector())
				;

		EnrichmentCoprocessFunction coprocessFunction = new EnrichmentCoprocessFunction() ; 
		// 3. Connect the streams to enrich data ( wait for watermark from both keyedRouteStream and keyedVehiclePositionStream)
		SingleOutputStreamOperator<EnrichedVehiclePosition> singleOutputStreamOperator = keyedVehiclePositionStream
			.connect(keyedRouteStream)
			.enableAsyncState()
			.process(coprocessFunction) // State is filled inside this function 
			.uid("EnrichmentCoprocessFunction") ; 

		// 4. Sink
		
		// 4.1  Enriched data  
		KafkaSink<EnrichedVehiclePosition> sink = EnrichedVehiclePositionSinkFactory.createSink(
				kafkaBootstrapServers,
				kafkaSinkTopic
		);
		singleOutputStreamOperator.sinkTo(sink);
		
		// 4.2 SideOutput to handle invalid data 
		KafkaSink<InvalidRecord<VehiclePosition>> invalidDataSink = InvalidVehiclePositionSinkFactory.createSink(
			kafkaBootstrapServers, 
			kafkaSinkSideOutputTopic
		);

		cleanedVehiclePositionStream
			.getSideOutput(validateFunction.REJECTED_TAG)
			.sinkTo(invalidDataSink); 

		singleOutputStreamOperator
			.getSideOutput(coprocessFunction.INVALID_MAPPING_TAG)
			.sinkTo(invalidDataSink)
		;




		// Execute program, beginning computation.
		env.execute("Silver - Enriched Vehicle Position");
	}
}
