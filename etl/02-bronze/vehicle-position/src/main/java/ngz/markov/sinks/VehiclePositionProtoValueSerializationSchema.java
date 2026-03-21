package ngz.markov.sinks  ; 

import org.apache.flink.api.common.serialization.SerializationSchema;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.gtfs.rt.proto.VehiclePositionOuterClass;
import ngz.markov.gtfs.rt.mapper.VehiclePositionProtoMapper;

public class VehiclePositionProtoValueSerializationSchema implements  SerializationSchema<VehiclePosition> {

    private static final Logger LOG = LoggerFactory.getLogger(VehiclePositionProtoValueSerializationSchema.class);

    @Override
    public byte[] serialize(VehiclePosition element){

        
        try{
            // 1. Convert to ProtobufObject
            VehiclePositionOuterClass.VehiclePosition proto = VehiclePositionProtoMapper.toProto(element) ; 

            // 2. Return its byte 
            return proto.toByteArray() ; 
        }catch(Exception e ){
            LOG.error("Failed to Serialize VehiclePosition to protobuf schema");
            LOG.error(e.getMessage());

            return null ; 
        }

    }
}
