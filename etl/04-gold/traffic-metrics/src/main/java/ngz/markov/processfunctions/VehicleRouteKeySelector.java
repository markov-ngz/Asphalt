package  ngz.markov.processfunctions ; 

import org.apache.flink.api.java.functions.KeySelector;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;

public class VehicleRouteKeySelector implements KeySelector<EnrichedVehiclePosition, String> {

    @Override
    public String getKey(EnrichedVehiclePosition value) throws Exception {
    
        return value.getCity() + "|" + value.getTransport() + "|" + value.getTrip().getRouteId() ;

    }
    
}
