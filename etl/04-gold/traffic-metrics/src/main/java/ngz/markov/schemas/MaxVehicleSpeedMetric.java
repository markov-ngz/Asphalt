package ngz.markov.schemas ; 


import lombok.Value;
import ngz.markov.traffic.metrics.model.MetricValue;

@Value
public class MaxVehicleSpeedMetric implements  MetricValue {
    double value;
}
