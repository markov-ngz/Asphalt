package ngz.markov.sources ; 

import java.nio.charset.StandardCharsets;
import java.util.Collection;

import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.connector.kafka.source.reader.deserializer.KafkaRecordDeserializationSchema;
import org.apache.flink.util.Collector;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.common.header.Header;
import org.apache.kafka.common.header.Headers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.protobuf.InvalidProtocolBufferException;
import com.google.transit.realtime.GtfsRealtime;

import ngz.markov.exceptions.GtfsRtVehiclePositionValueError;
import ngz.markov.exceptions.MissingRecordHeaderError;
import ngz.markov.exceptions.MissingRecordValueError;
import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.schemas.VehiclePositionMapper;

public class VehiclePositionsKafkaRecordDeserializationSchema implements KafkaRecordDeserializationSchema<VehiclePosition> {

    private static final Logger LOG = LoggerFactory.getLogger(VehiclePositionsKafkaRecordDeserializationSchema.class);
    private static final String HEADER_SOURCE_NAME = "source.transport";
    private static final String HEADER_SOURCE_CITY = "source.city";
    private static final String HEADER_REQUEST_ID = "source.headers.x-request-id";

    @Override
    public void deserialize(ConsumerRecord<byte[], byte[]> record, Collector<VehiclePosition> out) {
        try {
            Collection<VehiclePosition> vehiclePositions = parseRecord(record);
            if (vehiclePositions != null) {
                vehiclePositions.forEach(out::collect);
            }
        } catch (Exception e) {
            LOG.error("Failed to deserialize record from partition {} at offset {}", 
                record.partition(), record.offset(), e);
            
        }
    }

    @Override
    public TypeInformation<VehiclePosition> getProducedType() {
        return TypeInformation.of(VehiclePosition.class);
    }

    // -------- Logic Method --------

    /**
     * Logic factorized for testability. 
     * Tests can now pass a mocked ConsumerRecord or a real one easily.
     */
    protected Collection<VehiclePosition> parseRecord(ConsumerRecord<byte[], byte[]> record) throws MissingRecordHeaderError, MissingRecordValueError, InvalidProtocolBufferException, GtfsRtVehiclePositionValueError {
        
        // 1. Header Extraction
        String sourceName = getHeaderValue(record.headers(), HEADER_SOURCE_NAME);
        String sourceCity = getHeaderValue(record.headers(), HEADER_SOURCE_CITY);


        // 2. Value  Parsing
        return parseRecordValue(record.value(),sourceCity , sourceName) ; 

    }


    // --- Helper methods ---

    private String getHeaderValue(Headers headers, String key) throws MissingRecordHeaderError {
        Header header = headers.lastHeader(key);
        String headerValue = (header != null) ? new String(header.value(), StandardCharsets.UTF_8) : null;
        if (headerValue == null) {
            String message = String.format("Missing required header '{}'.", 
                HEADER_SOURCE_NAME)  ;  
            throw new MissingRecordHeaderError(message) ; 
        }

        return headerValue ; 
    }

    private Collection<VehiclePosition> parseRecordValue(byte[] recordValue, String cityHeader , String transportHeader) throws  MissingRecordValueError , InvalidProtocolBufferException, GtfsRtVehiclePositionValueError {
        
        // 1. Validation: Null check
        if (recordValue == null) {
            String message = String.format("Received empty payload (tombstone) at offset {}")  ;  
            throw new MissingRecordValueError(message); 
        }

        // Extract the feedMessage 
        GtfsRealtime.FeedMessage feedMessage = GtfsRealtime.FeedMessage.parseFrom(recordValue);

        // Create the object collection from feedmessage 
        return VehiclePositionMapper.fromGtfsFeedMessage(transportHeader, cityHeader, feedMessage) ;        

    }

    // ---

}
