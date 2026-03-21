package ngz.markov;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.streaming.api.datastream.KeyedStream;
import org.apache.flink.streaming.api.datastream.SideOutputDataStream;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.util.ParameterTool;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.processfunctions.ActiveVehicleProcessFunction;
import ngz.markov.processfunctions.VehiclePositionKeySelector;
import ngz.markov.sinks.EnrichedVehiclePositionSinkFactory;
import ngz.markov.sources.EnrichedVehiclePositionSourceFactory;

public class DataStreamJob {

	public static void main(String[] args) throws Exception {

		// 1. Parameters 

		ParameterTool parameters =  ParameterTool.fromArgs(args);

		String jobName = parameters.getRequired("pipeline.name");

		long minIdleTime =  parameters.getLong("rules.vehicle.idletime.ms",10000L);
		
		String kafkaBootstrapServers = parameters.getRequired("kafka.bootstrap.servers");
		String kafkaSourceTopic = parameters.getRequired("kafka.source.topic");
		String kafkaSourceGroupId =  parameters.getRequired("kafka.source.groupId");

		String kafkaActiveVehicleTopic = parameters.getRequired("kafka.sink.topic.activevehicle");
		String kafkaInactiveVehicleTopic = parameters.getRequired("kafka.sink.topic.inactivevehicle");

		// 2. Stream processing 

		// 2.1 Source 
		final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

		KafkaSource<EnrichedVehiclePosition> sourceEnrichedVehicle = EnrichedVehiclePositionSourceFactory.createSource(
			kafkaBootstrapServers, kafkaSourceGroupId, kafkaSourceTopic
		);

		KeyedStream keyedStream =  env
				.fromSource(sourceEnrichedVehicle, WatermarkStrategy.noWatermarks(), "enriched-vehicle-position")
				.keyBy(new VehiclePositionKeySelector());
		
		// 2.2 Filter active vehicles 

		// Use Side output for two output of a stream as TwoOutputStreamProcessFunction only works on keystream 
		ActiveVehicleProcessFunction activeVehicleProcessFunction = new ActiveVehicleProcessFunction(minIdleTime)  ; 
		
		SingleOutputStreamOperator<EnrichedVehiclePosition> activeVehiclesStream = keyedStream
			.enableAsyncState()
			.process(activeVehicleProcessFunction)
		;

		// get inactive vehicles  with side output
		SideOutputDataStream<EnrichedVehiclePosition> inactiveVehicleStream =  activeVehiclesStream
			.getSideOutput(activeVehicleProcessFunction.INACTIVE_TAG)
		;

		// 3. Sink 

		// 3.1 Sink active vehicles 
		KafkaSink<EnrichedVehiclePosition> activeSink = EnrichedVehiclePositionSinkFactory.createSink(
			kafkaBootstrapServers, kafkaActiveVehicleTopic)
		;
		activeVehiclesStream.sinkTo(activeSink) ; 


		// 3.2 sink inactive vehicles 
		KafkaSink<EnrichedVehiclePosition> inactiveSink = EnrichedVehiclePositionSinkFactory.createSink(
			kafkaBootstrapServers, kafkaInactiveVehicleTopic)
		;
		inactiveVehicleStream.sinkTo(inactiveSink) ; 

		// Execute program, beginning computation.
		env.execute(jobName);
	}
}
