package ngz.markov.sinks ; 

import org.apache.flink.api.common.serialization.SerializationSchema;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.gtfs.rt.mapper.EnrichedVehiclePositionMapper;
import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.gtfs.rt.proto.VehiclePositionOuterClass;



public class EnrichedVehiclePositionSerializationSchema implements SerializationSchema<EnrichedVehiclePosition>{

    private static final Logger LOG = LoggerFactory.getLogger(EnrichedVehiclePositionSerializationSchema.class);

    @Override
    public byte[] serialize(EnrichedVehiclePosition element){
        try {
            VehiclePositionOuterClass.EnrichedVehiclePosition proto =  EnrichedVehiclePositionMapper.toProto(element) ;   
            return  proto.toByteArray();   
        } catch (Exception e) {
            LOG.error("Failed to serialize EnrichedVehiclePosition to protobuf. Error : {}",e.getMessage());
            return null ; 
        }
        
    }
}
