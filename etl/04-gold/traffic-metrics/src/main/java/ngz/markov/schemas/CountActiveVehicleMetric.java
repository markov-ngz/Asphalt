package ngz.markov.schemas ;

import lombok.Value;
import ngz.markov.traffic.metrics.model.MetricValue;

@Value
public class CountActiveVehicleMetric implements MetricValue {
    int value;
}
