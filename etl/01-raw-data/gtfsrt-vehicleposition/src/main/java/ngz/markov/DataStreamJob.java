package ngz.markov;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.api.connector.source.util.ratelimit.RateLimiterStrategy;
import org.apache.flink.connector.datagen.source.DataGeneratorSource;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.util.ParameterTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class DataStreamJob {

	private static final Logger LOG = LoggerFactory.getLogger(DataStreamJob.class);

    public static void main(String[] args) throws Exception {

        LOG.info("Starting GTFS Protobuf Stream Job");
        
        LOG.info("Loading job configuration");

        // 0. Load the configuration 
        ParameterTool params = ParameterTool.fromArgs(args) ; 
        
        String jobName= params.getRequired("pipeline.name") ; 
        
        String sourceTransport =  params.getRequired("gtfs.source.transport") ;
        String sourceCity = params.getRequired("gtfs.source.city") ;
        String apiUrl = params.getRequired("gtfs.source.url");
        long pollIntervalMiliseconds = params.getLong("poll.interval.ms",30000L) ; 
        String bootstrapServers = params.getRequired("kafka.bootstrap.servers"); 
        String sinkTopic = params.getRequired("kafka.topic");
        
        LOG.info("Configuration Loaded , Creating Execution environment");



        // 1. Define the Source
        DataGeneratorSource<Long> loopSource = new DataGeneratorSource<>(
                index -> index, // Just emits 0, 1, 2...
                Long.MAX_VALUE,  // Run "forever"
                RateLimiterStrategy.perSecond(1.0/ ( pollIntervalMiliseconds / 1000 ) ), // Converting milisecond to second 
                org.apache.flink.api.common.typeinfo.Types.LONG
            );

        // 2. Create the DataStream and connect to Sink

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        env.fromSource(loopSource, WatermarkStrategy.noWatermarks(),"Gtfs Rt source")
            .setParallelism(1) // Ensure only one timer is running
            .map(new GtfsRequestMapper(apiUrl)) // This calls your HttpApiClient
            .name("HTTP API Fetcher")
            .sinkTo(KafkaSinkFactory.createSink(bootstrapServers,sinkTopic, sourceTransport , sourceCity)) // Pushes the byte[] to Kafka
            .name("Kafka Sink");
        
        LOG.info("Executing GTFS Protobuf Stream Job");
        
        env.execute(jobName);
    }

}

