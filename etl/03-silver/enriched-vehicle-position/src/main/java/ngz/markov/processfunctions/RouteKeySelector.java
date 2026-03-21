package ngz.markov.processfunctions ; 

import org.apache.flink.api.java.functions.KeySelector;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.gtfs.base.model.Route;

public class RouteKeySelector implements  KeySelector<CDCEvent<Route>, String>{
    
    @Override
    public String getKey(CDCEvent<Route> databaseCDCMessage){
        Route gtfsRoute = databaseCDCMessage.getObject() ; 
        return  gtfsRoute.getSourceCity() + "|" + gtfsRoute.getSourceTransport()  ; 
    }
}
