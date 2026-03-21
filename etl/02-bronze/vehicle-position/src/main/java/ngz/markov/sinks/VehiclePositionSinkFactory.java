package ngz.markov.sinks ; 

import org.apache.flink.connector.kafka.sink.KafkaRecordSerializationSchema;
import org.apache.flink.connector.kafka.sink.KafkaSink;

import ngz.markov.gtfs.rt.model.VehiclePosition;

public class VehiclePositionSinkFactory {
    public static KafkaSink<VehiclePosition> createSink(String bootstrapServers, String topic){

        // Sink<In data type>
        KafkaSink<VehiclePosition> sink = KafkaSink.<VehiclePosition>builder()
            .setBootstrapServers(bootstrapServers)
            .setRecordSerializer(
                 KafkaRecordSerializationSchema.builder()
                    .setTopic(topic)
                    .setKeySerializationSchema(new VehiclePositionProtoKeySerializationSchema())
                    .setValueSerializationSchema(new VehiclePositionProtoValueSerializationSchema())
                    .build()
            )
            .build()
        ;

        return sink ;
    }
}
