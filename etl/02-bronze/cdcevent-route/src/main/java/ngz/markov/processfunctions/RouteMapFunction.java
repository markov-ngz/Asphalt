package ngz.markov.processfunctions ; 

import org.apache.flink.api.common.functions.MapFunction;

import com.fasterxml.jackson.databind.ObjectMapper;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.gtfs.base.model.Route;

public class RouteMapFunction implements MapFunction<CDCEvent, CDCEvent<Route>>{
    
    private static final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public CDCEvent<Route> map(CDCEvent value) throws Exception{

        value.setObject(objectMapper.readValue(value.getJsonObject(), Route.class));
        
        return value ; 
    }
}
