package ngz.markov;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.datastream.SingleOutputStreamOperator;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.util.ParameterTool;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.gtfs.base.model.Route;
import ngz.markov.processfunctions.RouteMapFunction;
import ngz.markov.sinks.CDCEventRouteSink;
import ngz.markov.sources.CDCEventSource;


public class DataStreamJob {

	public static void main(String[] args) throws Exception {

		final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

		// 1. Load the config 
		ParameterTool parameters =  ParameterTool.fromArgs(args);
		
		String sourceBootstrapServers =parameters.getRequired("kafka.bootstrap.servers") ; 
		String sourceTopic =  parameters.getRequired("kafka.source.topic") ;
		String sourceGroupId  = parameters.getRequired("kafka.source.groupId") ;
		String sinkTopic =  parameters.getRequired("kafka.sink.topic") ;

		// Source receive CDCEvent
		KafkaSource<CDCEvent> source = CDCEventSource.createSource(
				sourceBootstrapServers,
				sourceGroupId,
				sourceTopic
			);

		// Sink 
		KafkaSink<CDCEvent<Route>> sink = CDCEventRouteSink.createSink(sourceBootstrapServers, sinkTopic) ; 

		// Job Flow 
		
		// 1. Read source topic 
		DataStreamSource<CDCEvent> streamRoute =  env.fromSource(
			source, 
			WatermarkStrategy.noWatermarks(), 
			"CDC Postgres"
		) ; 

		// 2. Map the JSON object to Route 
		SingleOutputStreamOperator<CDCEvent<Route>> routeStream= streamRoute
			.map(new RouteMapFunction())
			.uid("gtfsroute-serialization")
		;
		
		// 3. Sink to the topic 
		routeStream.sinkTo(sink) ; 
		
		// Execute program, beginning computation.
		env.execute("Bronze - CDCEventRoute");
	}
}
