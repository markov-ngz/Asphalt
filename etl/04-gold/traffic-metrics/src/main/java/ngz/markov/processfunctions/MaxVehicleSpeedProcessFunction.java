package ngz.markov.processfunctions; 

import org.apache.flink.streaming.api.functions.windowing.ProcessWindowFunction;
import org.apache.flink.streaming.api.windowing.windows.TimeWindow;
import org.apache.flink.util.Collector;

import ngz.markov.schemas.MaxVehicleSpeedMetric;
import ngz.markov.schemas.SpeedAccumulator;
import ngz.markov.traffic.metrics.model.RouteDimension;
import ngz.markov.traffic.metrics.model.TrafficMetric;

public class MaxVehicleSpeedProcessFunction 
    extends ProcessWindowFunction<SpeedAccumulator, TrafficMetric, String, TimeWindow> {

    private final String METRIC_NAME= "max.vehicles.speed" ; 
    
    @Override
    public void process(String key, Context context, Iterable<SpeedAccumulator> elements, Collector<TrafficMetric> out) {
        SpeedAccumulator acc = elements.iterator().next();

        TrafficMetric trafficMetric = TrafficMetric.builder()
            .name(METRIC_NAME)
            .dimension(new RouteDimension(
                acc.city,
                acc.transport,
                acc.routeId,
                acc.routeName,
                acc.routeDesc,
                acc.routeLongName
            ))
            .window(new ngz.markov.traffic.metrics.model.TimeWindow(
                context.window().getStart(),
                context.window().getEnd()
            ))
            .metric(new MaxVehicleSpeedMetric(acc.maxSpeed))
            .eventCount(acc.count)
            .build()
        ;    
        
        out.collect(trafficMetric);
    }
}