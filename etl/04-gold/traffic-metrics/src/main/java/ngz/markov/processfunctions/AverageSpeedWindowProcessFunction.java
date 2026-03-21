package ngz.markov.processfunctions ; 


import org.apache.flink.streaming.api.functions.windowing.ProcessWindowFunction;
import org.apache.flink.streaming.api.windowing.windows.TimeWindow;
import org.apache.flink.util.Collector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.schemas.AverageSpeedMetric;
import ngz.markov.traffic.metrics.model.RouteDimension;
import ngz.markov.traffic.metrics.model.TrafficMetric;

public class AverageSpeedWindowProcessFunction 
    extends ProcessWindowFunction<EnrichedVehiclePosition, TrafficMetric, String, TimeWindow> {

    private static final Logger LOG = LoggerFactory.getLogger(AverageSpeedWindowProcessFunction.class);

    private final String METRIC_NAME= "average.vehicle.speed" ; 

    @Override
    public void process(
            String key,
            Context context,
            Iterable<EnrichedVehiclePosition> elements,
            Collector<TrafficMetric> out) throws Exception {
        
        double totalSpeed = 0.0;
        int eventCount = 0;
        
        // Variables to hold metadata (same for all elements in the window)
        String city = null;
        String transport = null;
        String routeId = null;
        String routeName = null;
        String routeDesc = null;
        String routeLongName = null;

        // Compute sum and count
        for (EnrichedVehiclePosition event : elements) {
            totalSpeed += event.getPosition().getSpeed();
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
        
        // Skip empty windows (shouldn't happen but safety check)
        if (eventCount == 0) {
            return;
        }
        
        // Calculate average
        double averageSpeed = totalSpeed / eventCount;
        
        // Get window bounds
        long windowStart = context.window().getStart();
        long windowEnd = context.window().getEnd();
        
        // Create result
        TrafficMetric result = TrafficMetric.builder()
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
            .metric(new AverageSpeedMetric(averageSpeed))
            .eventCount(eventCount)
            .build()
        ;
        
        out.collect(result);
    }
}