package ngz.markov.processfunctions ; 

import org.apache.flink.api.java.functions.KeySelector;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;

public class VehiclePositionKeySelector implements  KeySelector<EnrichedVehiclePosition, String>{
    
    @Override
    public String getKey(EnrichedVehiclePosition vehiclePosition){
        return  vehiclePosition.getCity() + "|" + vehiclePosition.getTransport() ; 
    }
}
