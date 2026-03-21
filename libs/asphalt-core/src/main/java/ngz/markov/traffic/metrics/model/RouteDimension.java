package  ngz.markov.traffic.metrics.model ; 

public record RouteDimension(
        String city,
        String transport,
        String routeId,
        String routeName,
        String routeDesc,
        String routeLongName
) {}