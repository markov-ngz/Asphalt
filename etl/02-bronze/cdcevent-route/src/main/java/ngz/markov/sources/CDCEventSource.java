package ngz.markov.sources ; 

import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;

import ngz.markov.cdc.model.CDCEvent;

public class CDCEventSource {

   public static KafkaSource<CDCEvent> createSource(String bootstrapServers , String groupId , String topic ){

        KafkaSource<CDCEvent> source = KafkaSource.<CDCEvent>builder()
            .setBootstrapServers(bootstrapServers)
            .setTopics(topic)
            .setGroupId(groupId)
            .setStartingOffsets(OffsetsInitializer.latest())
            .setDeserializer( new CDCEventDeserializationSchema()) 
            .build();

        return source ; 
   } 
}
