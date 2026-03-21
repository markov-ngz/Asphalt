package ngz.markov.sources ;


import org.apache.flink.api.common.typeinfo.TypeHint;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.connector.kafka.source.reader.deserializer.KafkaRecordDeserializationSchema;
import org.apache.flink.util.Collector;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.gtfs.base.mapper.CDCEventRouteMapper;
import ngz.markov.cdc.proto.CDCEventRouteProtoOuterClass;
import ngz.markov.gtfs.base.model.Route;

public class CDCEventRouteDeserializationSchema
        implements  KafkaRecordDeserializationSchema<CDCEvent<Route>> {

    private static final Logger LOG =
            LoggerFactory.getLogger(CDCEventRouteDeserializationSchema.class);

    @Override
    public void deserialize(
            ConsumerRecord<byte[],byte[]> record,
            Collector<CDCEvent<Route>> out){

        try {
            CDCEventRouteProtoOuterClass.CDCEvent proto = CDCEventRouteProtoOuterClass.CDCEvent.parseFrom(record.value()) ; 
            CDCEvent<Route> cdcEventRoute = CDCEventRouteMapper.fromProto(proto) ; 
            if (cdcEventRoute != null) {
                out.collect(cdcEventRoute);
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

    @Override
    public TypeInformation<CDCEvent<Route>> getProducedType() {
       return TypeInformation.of(new TypeHint<CDCEvent<Route>>() {});
    }

}