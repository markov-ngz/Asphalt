package ngz.markov.processfunctions ; 

import java.util.HashSet;

import org.apache.flink.streaming.api.functions.windowing.ProcessWindowFunction;
import org.apache.flink.streaming.api.windowing.windows.TimeWindow;
import org.apache.flink.util.Collector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.schemas.CountActiveVehicleMetric;
import ngz.markov.traffic.metrics.model.RouteDimension;
import ngz.markov.traffic.metrics.model.TrafficMetric;

public class CountActiveVehicleWindowProcessFunction extends 
    ProcessWindowFunction<EnrichedVehiclePosition, TrafficMetric, String, TimeWindow>  {

    private static final Logger LOG = LoggerFactory.getLogger(AverageSpeedWindowProcessFunction.class);

    private final String METRIC_NAME= "count.vehicle.active" ; 

    @Override
    public void process(
            String key,
            Context context,
            Iterable<EnrichedVehiclePosition> elements,
            Collector<TrafficMetric> out) throws Exception {
        
        HashSet<String> uniqueVehicles = new HashSet();
        
        // Variables to hold metadata (same for all elements in the window)
        String city = null;
        String transport = null;
        String routeId = null;
        String routeName = null;
        String routeDesc = null;
        String routeLongName = null;

        int eventCount = 0 ;

        for (EnrichedVehiclePosition event : elements) {
            String vehicleId = event.getVehicle().getId();
            
            uniqueVehicles.add(vehicleId); 
            
            eventCount++;
            
            // Capture metadata from first event
            if (city == null) {
                city = event.getCity();
                transport = event.getTransport();
                routeId = event.getTrip().getRouteId();
                routeName = event.getRouteShortName() ;
                routeDesc = event.getRouteDesc() ;
                routeLongName = event.getRouteLongName();
            }
        }

        long windowStart = context.window().getStart();
        long windowEnd = context.window().getEnd();

        TrafficMetric trafficMetric = TrafficMetric.builder()
            .name(METRIC_NAME)
            .dimension(new RouteDimension(
                city,
                transport,
                routeId,
                routeName,
                routeDesc,
                routeLongName
            ))
            .window(new ngz.markov.traffic.metrics.model.TimeWindow(
                windowStart,
                windowEnd
            ))
            .metric(new CountActiveVehicleMetric(uniqueVehicles.size()))
            .eventCount(eventCount)
            .build()
        ;     


        out.collect(trafficMetric) ; 
    
    }
}
