package ngz.markov.traffic.metrics.model;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class TrafficMetric {

    String name ; 
    
    // Who 
    private RouteDimension dimension;
    // When 
    private TimeWindow window;
    // What 
    private MetricValue metric;
    // Additional data 
    private int eventCount;

}