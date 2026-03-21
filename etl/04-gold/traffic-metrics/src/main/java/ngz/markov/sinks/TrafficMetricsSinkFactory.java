package ngz.markov.sinks ;

import org.apache.flink.connector.kafka.sink.KafkaRecordSerializationSchemaBuilder;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.formats.json.JsonSerializationSchema;

import ngz.markov.traffic.metrics.model.TrafficMetric;

public class TrafficMetricsSinkFactory {
    public static KafkaSink<TrafficMetric> createMetricSink(
        String bootstrapServers,
        String topic
    ){

        JsonSerializationSchema<TrafficMetric> jsonFormat =new JsonSerializationSchema<>();

        // Sink<In data type>
        KafkaSink<TrafficMetric> sink = KafkaSink.<TrafficMetric>builder()
            .setBootstrapServers(bootstrapServers)
            .setRecordSerializer(
                new KafkaRecordSerializationSchemaBuilder<>()
                .setValueSerializationSchema(jsonFormat)
                .setTopic(topic)
                .build()
            )
            
            .build()
        ;

        return sink ;
    }

}
