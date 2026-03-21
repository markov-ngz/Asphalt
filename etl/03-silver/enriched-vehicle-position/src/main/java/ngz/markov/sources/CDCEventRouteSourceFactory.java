package ngz.markov.sources ; 

import org.apache.flink.connector.kafka.source.KafkaSource;
import org.apache.flink.connector.kafka.source.enumerator.initializer.OffsetsInitializer;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.gtfs.base.model.Route;

public class CDCEventRouteSourceFactory {

   public static KafkaSource<CDCEvent<Route>> createSource(String bootstrapServers , String groupId , String topic){

        KafkaSource<CDCEvent<Route>> source = KafkaSource.<CDCEvent<Route>>builder()
            .setBootstrapServers(bootstrapServers)
            .setTopics(topic)
            .setGroupId(groupId)
            .setStartingOffsets(OffsetsInitializer.latest())
            .setDeserializer( new CDCEventRouteDeserializationSchema()) 
            .build();

        return source ; 
   } 
}
