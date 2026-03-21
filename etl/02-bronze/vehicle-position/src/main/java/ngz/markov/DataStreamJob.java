package ngz.markov;

import java.util.Arrays;
import java.util.List;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.util.ParameterTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.sinks.VehiclePositionSinkFactory;
import ngz.markov.sources.VehiclePositionSourceFactory;


public class DataStreamJob {

	private static final Logger LOG = LoggerFactory.getLogger(DataStreamJob.class);
    
    private static final String SOURCE_TOPIC_DELIMITER = "\\|" ; // escape as it is a regex 
    
	public static void main(String[] args) throws Exception {

		LOG.info("Starting Bronze VehiclePosition Job ");
        
        // 1. Fail fast loading config
        ParameterTool params = ParameterTool.fromArgs(args) ; 

        String jobName= params.getRequired("pipeline.name") ; 

        String bootstrapServers = params.getRequired("kafka.bootstrap.servers") ; 
        String groupId = params.getRequired("kafka.source.groupId");
        String[] topicsArray = params.getRequired("kafka.source.topic").split(SOURCE_TOPIC_DELIMITER) ; 
        List<String> sourceTopics = Arrays.asList(topicsArray) ; 

        String sinkTopic = params.getRequired("kafka.sink.topic")  ; 

        // 2. Sets up the execution environment
		final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // 3. Setup Stream Resources
        
        // - Source 
        KafkaSource<VehiclePosition> source = VehiclePositionSourceFactory.createSource(
            bootstrapServers,
            groupId,
            sourceTopics
        ) ; 

        // - Watermark strategy :  No watermark as timestamp order does not matter for pure processing job 
        WatermarkStrategy<VehiclePosition> wmStrategy = WatermarkStrategy.noWatermarks();

        // - Sink
        KafkaSink<VehiclePosition> sink = VehiclePositionSinkFactory.createSink(
            bootstrapServers,
            sinkTopic
        ); 

        // 4. Create the actual stream 

        // 4.1 Add the source of "raw" data 
        DataStreamSource stream = env.fromSource(
                source, 
                wmStrategy, 
                "gtfsrt.vehicle-position"
            );
        // 4.3 Sink them to "clean" topic 
        stream.sinkTo(sink);
	
		// 5. Execute program, beginning computation.
		env.execute(jobName);
	}

}