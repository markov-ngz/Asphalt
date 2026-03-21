package ngz.markov.processfunctions ; 

import org.apache.flink.api.common.functions.AggregateFunction;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.schemas.SpeedAccumulator;


public class MaxSpeedAggregator 
    implements AggregateFunction<EnrichedVehiclePosition, SpeedAccumulator, SpeedAccumulator> {

    @Override
    public SpeedAccumulator createAccumulator() {
        return new SpeedAccumulator();
    }

    @Override
    public SpeedAccumulator add(EnrichedVehiclePosition value, SpeedAccumulator acc) {
        acc.maxSpeed = Math.max(acc.maxSpeed, value.getPosition().getSpeed());
        acc.count++;
        // Capture metadata from the first record
        if (acc.city == null) {
            acc.city = value.getCity();
            acc.transport = value.getTransport();
            acc.routeId = value.getTrip().getRouteId();
            acc.routeName = value.getRouteShortName() ; 
            acc.routeDesc = value.getRouteDesc() ; 
            acc.routeLongName = value.getRouteLongName() ; 
        }


        return acc;
    }

    @Override
    public SpeedAccumulator getResult(SpeedAccumulator acc) { return acc; }

    @Override
    public SpeedAccumulator merge(SpeedAccumulator a, SpeedAccumulator b) {
        a.maxSpeed = Math.max(a.maxSpeed, b.maxSpeed);
        a.count += b.count;
        return a;
    }
    
}