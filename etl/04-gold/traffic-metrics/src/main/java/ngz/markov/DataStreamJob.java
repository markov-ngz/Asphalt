package ngz.markov;

import java.time.Duration;

import org.apache.flink.api.common.eventtime.WatermarkStrategy;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.datastream.DataStreamSource;
import org.apache.flink.streaming.api.datastream.KeyedStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.api.windowing.assigners.SlidingEventTimeWindows;
import org.apache.flink.util.ParameterTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.processfunctions.AverageSpeedWindowProcessFunction;
import ngz.markov.processfunctions.CountActiveVehicleWindowProcessFunction;
import ngz.markov.processfunctions.MaxSpeedAggregator;
import ngz.markov.processfunctions.MaxVehicleSpeedProcessFunction;
import ngz.markov.processfunctions.VehicleRouteKeySelector;
import ngz.markov.sinks.TrafficMetricsSinkFactory;
import ngz.markov.sources.EnrichedVehiclePositionSourceFactory;
import ngz.markov.traffic.metrics.model.TrafficMetric;

public class DataStreamJob {

	private static final Logger LOG = LoggerFactory.getLogger(DataStreamJob.class);

	public static void main(String[] args) throws Exception {

		LOG.info("Starting GTFS Vehicle Position Mapping Job");
        
        // 1. Loading config 

        ParameterTool params = ParameterTool.fromArgs(args) ; 

        String kafkaBootstrapServers = params.getRequired("kafka.bootstrap.servers");
        String kafkaSourceTopic =params.getRequired("kafka.source.topic") ;
        String kafkaSourceGroupId = params.getRequired("kafka.source.groupId");
        String kafkaAvgSpeedTopic = params.getRequired("kafka.sink.topic.avgspeed");
        String kafkaCountVehicleTopic = params.getRequired("kafka.sink.topic.countvehicle");
        String kafkaMaxVehicleSpeedTopic = params.getRequired("kafka.sink.topic.maxvehiclespeed");

		// to building Flink applications.
		final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        // 1. Source 
		KafkaSource<EnrichedVehiclePosition> source  = EnrichedVehiclePositionSourceFactory.createSource(
            kafkaBootstrapServers,
            kafkaSourceGroupId,
            kafkaSourceTopic
        ) ; 

        // watermark strategy : accepting disorder in timestamp 
        WatermarkStrategy<EnrichedVehiclePosition> watermarkStrategy = WatermarkStrategy.
            <EnrichedVehiclePosition>forBoundedOutOfOrderness(Duration.ofSeconds(30))
                .withTimestampAssigner((event, timestamp) -> event.getTimestamp()* 1000L)
                .withIdleness(Duration.ofMinutes(1))
        ;
        
		DataStreamSource<EnrichedVehiclePosition> streamSource = env.fromSource(
            source, 
            watermarkStrategy, 
            "vehicle-position"
        );

        // 2. Key the stream by Vehicle Bus/Train "Line"

        // Filter the "active" vehicle 
        KeyedStream keyedStream=  streamSource
            .keyBy(new VehicleRouteKeySelector())  ; 
        
        // 3. Traffic Metrics

        // 3.1 Avg SpeedResults 
		DataStream<TrafficMetric> averageSpeedStream = keyedStream 
            // Apply Sliding time window to compute the last 10 minutes refreshed every minutes 
            .window(SlidingEventTimeWindows.of( Duration.ofMinutes(2), Duration.ofMinutes(1)))
            // Compute average speed
            .process(new AverageSpeedWindowProcessFunction());
        

        // 3.2 Number of active bus by line
		DataStream<TrafficMetric> countActiveVehicleStream = keyedStream
            .window(SlidingEventTimeWindows.of( Duration.ofMinutes(2), Duration.ofMinutes(1)))
            .process(new CountActiveVehicleWindowProcessFunction())
        ;

        // 3.3 Fastest vehicle ( the flashmacqueen of bus )
		DataStream<TrafficMetric> maxVehicleSpeedStream = keyedStream
            .window(SlidingEventTimeWindows.of( Duration.ofMinutes(2), Duration.ofMinutes(1)))
            .aggregate(new MaxSpeedAggregator(), new MaxVehicleSpeedProcessFunction())
        ;

        // 4. Sink Metrics 

        KafkaSink<TrafficMetric> countActiveVehicleSink = TrafficMetricsSinkFactory.createMetricSink(
            kafkaBootstrapServers,
            kafkaCountVehicleTopic
        );
        countActiveVehicleStream.sinkTo(countActiveVehicleSink) ; 

        KafkaSink<TrafficMetric> avgSpeedResultSink = TrafficMetricsSinkFactory.createMetricSink(
            kafkaBootstrapServers,
            kafkaAvgSpeedTopic
        );
        averageSpeedStream.sinkTo(avgSpeedResultSink); 

        KafkaSink<TrafficMetric> maxVehicleSpeedResultSink = TrafficMetricsSinkFactory.createMetricSink(
            kafkaBootstrapServers,
            kafkaMaxVehicleSpeedTopic
        );
        maxVehicleSpeedStream.sinkTo(maxVehicleSpeedResultSink); 


		// Execute program, beginning computation.
		env.execute("Gold - Traffic Metrics ");
		
	}

}
