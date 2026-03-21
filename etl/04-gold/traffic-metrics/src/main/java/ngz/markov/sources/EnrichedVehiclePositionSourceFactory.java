package ngz.markov.sources;

import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;

public class EnrichedVehiclePositionSourceFactory {


   public static KafkaSource<EnrichedVehiclePosition> createSource(
        String bootstrapServers,
        String groupId,
        String topics
   ){

        KafkaSource<EnrichedVehiclePosition> source = KafkaSource.<EnrichedVehiclePosition>builder()
            .setBootstrapServers(bootstrapServers)
            .setTopics(topics)
            .setGroupId(groupId)
            .setStartingOffsets(OffsetsInitializer.latest())
            .setDeserializer(new EnrichedVehiclePositionKafkaRecordDeserializationSchema() ) 
            .build();

        return source ; 
   } 
}
