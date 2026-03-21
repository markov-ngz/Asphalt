package ngz.markov.sinks ;

import org.apache.flink.connector.kafka.sink.KafkaRecordSerializationSchema;
import org.apache.flink.connector.kafka.sink.KafkaSink;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;

public class EnrichedVehiclePositionSinkFactory {
    public static KafkaSink<EnrichedVehiclePosition> createSink(        
        String bootstrapServers,
        String topic
    ){
        return KafkaSink.<EnrichedVehiclePosition>builder()
            .setBootstrapServers(bootstrapServers)
            .setRecordSerializer(
                KafkaRecordSerializationSchema.builder()
                .setTopic(topic)
                .setValueSerializationSchema(new EnrichedVehiclePositionSerializationSchema())
                .build() 
            ).build() ; 
    }
}
