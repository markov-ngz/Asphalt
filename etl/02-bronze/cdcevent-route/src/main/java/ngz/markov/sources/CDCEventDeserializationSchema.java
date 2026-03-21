package ngz.markov.sources ;

import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;

import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.connector.kafka.source.reader.deserializer.KafkaRecordDeserializationSchema;
import org.apache.flink.util.Collector;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import ngz.markov.cdc.model.CDCEvent;

public class CDCEventDeserializationSchema
        implements  KafkaRecordDeserializationSchema<CDCEvent> {

    private static final Logger LOG =
            LoggerFactory.getLogger(CDCEventDeserializationSchema.class);

    private static final ObjectMapper MAPPER = new ObjectMapper();

    @Override
    public void deserialize(
            ConsumerRecord<byte[],byte[]> record,
            Collector<CDCEvent> out){

        try {
            CDCEvent databaseCDCMessage = parseRecord(record);
            if (databaseCDCMessage != null) {
                out.collect(databaseCDCMessage);
            }
        } catch (Exception e) {
            LOG.error(
                "Failed to deserialize CDCEvent| partition={} | offset={}",
                record.partition(),
                record.offset(),
                e
            );
        }
    }

    protected CDCEvent parseRecord(ConsumerRecord<byte[],byte[]> record) throws Exception {

        byte[] payload = record.value();

        if (payload == null) {
            return null; // tombstone
        }

        JsonNode root =
                MAPPER.readTree(new String(payload, StandardCharsets.UTF_8));

        String op = root.path("op").asText();
        
        // Debezium-like envelope handling
        JsonNode dataNode = extractDataNodeFromDebeziumEnvelope(root, op) ; 

        if (dataNode == null || dataNode.isNull()) {
            return null;
        }

        return mapCDCEvent(dataNode, op) ; 
    }

    private JsonNode extractDataNodeFromDebeziumEnvelope(JsonNode root, String op){
        
        String envelope;
        
        if ("d".equals(op)) {
            envelope = "before";
        } else {
            envelope = "after";
        }

        return root.path(envelope);
    } 

    private CDCEvent mapCDCEvent(JsonNode dataNode , String op){

        CDCEvent databaseCDCMessage = new CDCEvent();

        String opTs = dataNode.path("op_ts").asText() ; 

        long opTsLong = convertOpTs(opTs) ;
        
        databaseCDCMessage.setDatabaseName(dataNode.path("database_name").asText());
        databaseCDCMessage.setSchema(dataNode.path("schema_name").asText());
        databaseCDCMessage.setTable(dataNode.path("table_name").asText());
        databaseCDCMessage.setRecordTimestamp(opTsLong);
        databaseCDCMessage.setJsonObject(dataNode.path("value_payload").asText());
        databaseCDCMessage.setRowKind(op , dataNode.path("row_kind").asText());

        return databaseCDCMessage ; 
    }

    /**
     *  Convert a timestamp to long 
     * 
     *  Exemple : "2026-01-31 18:38:25.681Z" -> 165484552541
     */
    protected long convertOpTs(String opTs){

        // Debeizum date time format 
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSSX");

        OffsetDateTime odt = OffsetDateTime.parse(opTs, formatter);
        Instant instant = odt.toInstant();

        long timestampMillis = instant.toEpochMilli();

        return timestampMillis ; 
    }

    

    @Override
    public TypeInformation<CDCEvent> getProducedType() {
        return TypeInformation.of(CDCEvent.class);
    }

}