package ngz.markov.sinks ;

import org.apache.flink.connector.kafka.sink.KafkaRecordSerializationSchema;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.flink.formats.json.JsonSerializationSchema;

import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.quality.model.InvalidRecord;

public class InvalidVehiclePositionSinkFactory {
    public static KafkaSink<InvalidRecord<VehiclePosition>> createSink(        
        String bootstrapServers,
        String topic
    ){
        return KafkaSink.<InvalidRecord<VehiclePosition>>builder()
            .setBootstrapServers(bootstrapServers)
            .setRecordSerializer(
                KafkaRecordSerializationSchema.builder()
                .setTopic(topic)
                .setValueSerializationSchema(new JsonSerializationSchema())
                .build() 
            ).build() ; 
    }
}
