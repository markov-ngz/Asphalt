package ngz.markov.sinks ; 


import org.apache.flink.connector.kafka.sink.KafkaRecordSerializationSchema;
import org.apache.flink.connector.kafka.sink.KafkaSink;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.gtfs.base.model.Route;


public class CDCEventRouteSink {
    public static KafkaSink<CDCEvent<Route>> createSink(
        String bootstrapServers,
        String topic
    ){
        return KafkaSink.<CDCEvent<Route>>builder()
            .setBootstrapServers(bootstrapServers)
            .setRecordSerializer(
                KafkaRecordSerializationSchema.builder()
                .setTopic(topic)
                .setValueSerializationSchema(new CDCEventRouteValueSerializationSchema())
                .build()
            )
            .build() 
        ; 
    }
}
