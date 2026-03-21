package ngz.markov.gtfs.rt.model ;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Trip {
    private String tripId;
    private String scheduleRelationship;
    private String routeId;
    private int directionId;
}
