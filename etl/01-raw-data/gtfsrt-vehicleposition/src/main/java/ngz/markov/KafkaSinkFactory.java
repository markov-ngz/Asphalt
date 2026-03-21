package ngz.markov;
import org.apache.flink.api.common.serialization.SerializationSchema;
import org.apache.flink.connector.kafka.sink.HeaderProvider;
import org.apache.flink.connector.kafka.sink.KafkaRecordSerializationSchema;
import org.apache.flink.connector.kafka.sink.KafkaSink;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.header.Headers;
import org.apache.kafka.common.header.internals.RecordHeaders;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.gtfsrt.GtfsRtApiResponse;

/**
 * Factory for creating Kafka sink with proper configuration for raw protobuf data.
 */
public class KafkaSinkFactory {
    
    private static final Logger LOG = LoggerFactory.getLogger(KafkaSinkFactory.class);
    
    /**
     * Creates a KafkaSink configured for raw byte array (protobuf) data.
     * 
     * @param params job parameters containing Kafka configuration
     * @return configured KafkaSink
     */
    public static KafkaSink<GtfsRtApiResponse> createSink(String bootstrapServers , String topic,  String sourceTransport, String sourceCity) {
        
        LOG.info("Creating Kafka sink for topic '{}' with bootstrap servers: {}", 
            topic, bootstrapServers);
        
        KafkaSink<GtfsRtApiResponse> sink = KafkaSink.<GtfsRtApiResponse>builder()
            .setBootstrapServers(bootstrapServers)
            .setRecordSerializer(createKafkaRecordSerializationSchema(topic, sourceTransport, sourceCity))
            .setProperty(ProducerConfig.COMPRESSION_TYPE_CONFIG, "snappy")
            .setProperty(ProducerConfig.LINGER_MS_CONFIG, "100")
            .setProperty(ProducerConfig.BATCH_SIZE_CONFIG, "16384")
            .setProperty(ProducerConfig.ACKS_CONFIG, "1")
            .build();
        
        LOG.info("Kafka sink created successfully");
        return sink;
    }
    
    /**
     * Creates a serialization schema that writes raw bytes to Kafka.
     * 
     * @param topic the target Kafka topic
     * @return KafkaRecordSerializationSchema for byte arrays
     */
    private static KafkaRecordSerializationSchema<GtfsRtApiResponse> createKafkaRecordSerializationSchema(String topic, String sourceTransport, String sourceCity) {
        return KafkaRecordSerializationSchema.builder()
            .setTopic(topic)
            .setHeaderProvider(new CustomHeaderProvider(sourceTransport, sourceCity))
            .setValueSerializationSchema(new RawByteSerializationSchema())
            .build();
    }

    /*
    *  Custom Header provider to add : 
    *  - the source header to each record 
    */
    private static class CustomHeaderProvider implements HeaderProvider<GtfsRtApiResponse>{

        private final String sourceTransport ; 
        private final String sourceCity ; 

        CustomHeaderProvider(String sourceTransport, String sourceCity){
            this.sourceTransport = sourceTransport ;
            this.sourceCity = sourceCity ;
        }

        @Override
        public Headers getHeaders(GtfsRtApiResponse input) {

            // Base header 
            RecordHeaders headers = new RecordHeaders();

            // Add headers 
            // Source
            headers.add("source.transport", sourceTransport.getBytes());
            headers.add("source.city", sourceCity.getBytes());

            // X Request Id to identify the object at further stages 
            if(input.getRequestId() != null ){
                headers.add("source.headers.x-request-id",input.getRequestId().getBytes()); 
            }

            return headers;
        }
    }
    /**
     * Simple serialization schema that passes through raw bytes without modification.
     */
    private static class RawByteSerializationSchema implements SerializationSchema<GtfsRtApiResponse> {
        
        @Override
        public byte[] serialize(GtfsRtApiResponse element) {
            return element.getProtobufData();
        }
    }


}