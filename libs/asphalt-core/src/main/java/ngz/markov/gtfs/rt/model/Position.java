package ngz.markov.gtfs.rt.model ;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Position {
    private double latitude;
    private double longitude;
    private double bearing;
    private double speed;
}
