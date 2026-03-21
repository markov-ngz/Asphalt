package ngz.markov.sources ; 

import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.connector.kafka.source.reader.deserializer.KafkaRecordDeserializationSchema;
import org.apache.flink.util.Collector;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.protobuf.InvalidProtocolBufferException;

import ngz.markov.exceptions.MissingRecordHeaderError;
import ngz.markov.exceptions.MissingRecordValueError;
import ngz.markov.gtfs.rt.exceptions.VehiclePositionProtoValueError;
import ngz.markov.gtfs.rt.mapper.VehiclePositionProtoMapper;
import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.gtfs.rt.proto.VehiclePositionOuterClass;

/* 
* Custom kafka deserialization class, parsing from record to VehiclePosition
*/
public class VehiclePositionKafkaRecordDeserializationSchema implements KafkaRecordDeserializationSchema<VehiclePosition> {

    private static final Logger LOG = LoggerFactory.getLogger(VehiclePositionKafkaRecordDeserializationSchema.class);

    @Override
    public void deserialize(ConsumerRecord<byte[], byte[]> record, Collector<VehiclePosition> out) {
        try {
            VehiclePosition message = parseRecord(record);
            if (message != null) {
                out.collect(message);
            }
        } catch (Exception e) {
            // Flink's best practice: decide whether to fail the job or skip the record
            LOG.error("Failed to deserialize record from partition {} at offset {}", 
                record.partition(), record.offset(), e);
        }
    }

    /**
     * Logic factorized for testability. 
     * Tests can now pass a mocked ConsumerRecord or a real one easily.
     */
    protected VehiclePosition parseRecord(ConsumerRecord<byte[], byte[]> record) throws MissingRecordHeaderError, MissingRecordValueError{
        byte[] payload = record.value();

        // 1. Validation: Null check
        if (payload == null) {
            String message = String.format("Received empty payload (tombstone) at offset {}", record.offset())  ;  
            throw new MissingRecordValueError(message); 
        }

        // 2. Header Extraction
        // Skip -> No useful headers 

        // 3. Protobuf Parsing
        try {
            
            // Parse the byte to the protobuf format 
            VehiclePositionOuterClass.VehiclePosition proto = VehiclePositionOuterClass.VehiclePosition.parseFrom(payload) ; 

            // Map it to serializable object 
            return  VehiclePositionProtoMapper.fromProto(proto);

        } catch (InvalidProtocolBufferException | VehiclePositionProtoValueError e) {
            LOG.error("Protobuf parse error | Timestamp: {} | Topic: {} | RecordId : {} | Error: {}", 
                record.timestamp(),record.topic(), record.key() ,e.getMessage());
            return null;
        }
    }

    @Override
    public TypeInformation<VehiclePosition> getProducedType() {
        return TypeInformation.of(VehiclePosition.class);
    }

    // private String getHeaderValue(Headers headers, String key) {
    //     Header header = headers.lastHeader(key);
    //     return (header != null) ? new String(header.value(), StandardCharsets.UTF_8) : null;
    // }

}
