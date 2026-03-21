package ngz.markov.gtfs.rt.model ;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper=true)
@ToString(callSuper=true)
public class EnrichedVehiclePosition  extends  VehiclePosition {


    // Enrichment Fields 
    private String routeShortName;
    private String routeLongName;
    private String routeDesc;
    private Integer routeType;

}