package ngz.markov.gtfs.rt.model ;

import java.io.Serializable;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class VehiclePosition  implements Serializable {

    private Trip trip;
    private Position position;
    private String currentStatus;
    private long timestamp;
    private String stopId;
    private Vehicle vehicle;

    // Additional fields
    private String transport;
    private String city;

}