package ngz.markov.sources;

import java.util.List;

import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;

import ngz.markov.gtfs.rt.model.VehiclePosition;


public class VehiclePositionSourceFactory {


   public static KafkaSource<VehiclePosition> createSource(String bootstrapServers, String groupId, List<String> topics){

        KafkaSource<VehiclePosition> source = KafkaSource.<VehiclePosition>builder()
            .setBootstrapServers(bootstrapServers)
            .setTopics(topics)
            .setGroupId(groupId)
            .setStartingOffsets(OffsetsInitializer.earliest())
            .setDeserializer(new VehiclePositionsKafkaRecordDeserializationSchema() ) 
            .build();

        return source ; 
   } 
}
