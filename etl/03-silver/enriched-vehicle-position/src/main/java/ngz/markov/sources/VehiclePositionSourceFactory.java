package ngz.markov.sources;

import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;

import ngz.markov.gtfs.rt.model.VehiclePosition;


public class VehiclePositionSourceFactory {


   public static KafkaSource<VehiclePosition> createSource(
        String bootstrapServers,
        String groupId,
        String topics
   ){

        KafkaSource<VehiclePosition> source = KafkaSource.<VehiclePosition>builder()
            .setBootstrapServers(bootstrapServers)
            .setTopics(topics)
            .setGroupId(groupId)
            .setStartingOffsets(OffsetsInitializer.latest())
            .setDeserializer(new VehiclePositionKafkaRecordDeserializationSchema() ) 
            .build();

        return source ; 
   } 
}
