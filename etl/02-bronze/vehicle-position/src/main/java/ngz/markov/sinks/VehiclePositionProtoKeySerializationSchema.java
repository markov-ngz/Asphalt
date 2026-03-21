package ngz.markov.sinks ;

import org.apache.flink.api.common.serialization.SerializationSchema;

import ngz.markov.gtfs.rt.model.VehiclePosition;



public class VehiclePositionProtoKeySerializationSchema implements SerializationSchema<VehiclePosition>{

    @Override
    public byte[] serialize(VehiclePosition element){

        String compositeKey = String.format("{}.{}.{}.{}", element.getCity(), element.getTransport(), element.getVehicle().getId(), element.getTimestamp()); 
        return compositeKey.getBytes() ; 
    }
    
}
