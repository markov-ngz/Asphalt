package ngz.markov.gtfs.base.model ;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Route {

    public Integer id;
    
    public String routeId;
    public String agencyId;
    public String routeShortName;
    public String routeLongName;
    public String routeDesc;
    public Integer routeType;
    public String routeUrl;
    public String routeColor;
    public String routeTextColor;
    public Integer routeSortOrder;

    
    public String updatedAt;    
    public String sourceCity;
    public String sourceTransport;


    public String operation; // c, u, d
    public String operationTimestamp ; 

}
