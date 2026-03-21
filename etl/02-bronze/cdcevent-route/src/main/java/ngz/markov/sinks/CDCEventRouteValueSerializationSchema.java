package ngz.markov.sinks  ; 

import org.apache.flink.api.common.serialization.SerializationSchema;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.cdc.proto.CDCEventRouteProtoOuterClass;
import ngz.markov.gtfs.base.mapper.CDCEventRouteMapper;
import ngz.markov.gtfs.base.model.Route;


public class CDCEventRouteValueSerializationSchema  implements SerializationSchema<CDCEvent<Route>> {
    @Override
    public byte[] serialize(CDCEvent<Route> element){

        CDCEventRouteProtoOuterClass.CDCEvent proto =  CDCEventRouteMapper.toProto(element) ; 

        return  proto.toByteArray(); 
    }
}
