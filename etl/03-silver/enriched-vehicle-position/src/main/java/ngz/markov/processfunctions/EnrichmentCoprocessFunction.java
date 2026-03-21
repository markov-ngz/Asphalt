package ngz.markov.processfunctions ;


import java.lang.invoke.MethodHandles;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.apache.flink.api.common.functions.OpenContext;
import org.apache.flink.api.common.state.StateTtlConfig;
import org.apache.flink.api.common.state.v2.MapState;
import org.apache.flink.api.common.state.v2.MapStateDescriptor; //v2 for asynchronous state backend access
import org.apache.flink.api.common.typeinfo.TypeHint;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.streaming.api.functions.co.KeyedCoProcessFunction;
import org.apache.flink.types.RowKind;
import org.apache.flink.util.Collector;
import org.apache.flink.util.OutputTag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.gtfs.base.model.Route;
import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.quality.model.InvalidRecord;

public class EnrichmentCoprocessFunction 
    extends  KeyedCoProcessFunction<String, EnrichedVehiclePosition, CDCEvent<Route>, EnrichedVehiclePosition> {


    private static final Logger LOG = LoggerFactory.getLogger(EnrichmentCoprocessFunction.class);

    MapState<String, CDCEvent<Route>> routeState ; 

    MapState<String, CDCEvent<Route>> deletedRouteState ; 

    public final OutputTag<InvalidRecord<VehiclePosition>> INVALID_MAPPING_TAG = new OutputTag<InvalidRecord<VehiclePosition>>("invalid-mapping"){};

    @Override
    public void processElement1(EnrichedVehiclePosition in1,Context ctx, Collector<EnrichedVehiclePosition> out) throws Exception {
        
        // Get the routeId
        String stateKey = getStateKey(in1) ; 

        // Check if the routeId exists in the State 
        routeState.asyncGet(stateKey).thenAccept((CDCEvent<Route> cdcEventRoute)-> {
            
            if(cdcEventRoute == null ){
                
                List<String> errors = new ArrayList<>() ; 
                errors.add("impossible routeId mapping"); 

                ctx.output(INVALID_MAPPING_TAG, buildInvalidRecord(in1, errors));
            
            }else{
                    
                Route route = cdcEventRoute.getObject() ; 

                in1.setRouteShortName(route.getRouteShortName());
                in1.setRouteLongName(route.getRouteLongName()) ; 
                in1.setRouteDesc(route.getRouteDesc());
                in1.setRouteType(route.getRouteType());
                
                // Anyway collect the object 
                out.collect(in1) ; 
            }
            

            
        });

    }

    @Override
    public void processElement2(
            CDCEvent<Route> in2,
            Context ctx,
            Collector<EnrichedVehiclePosition> out) throws Exception {

        String key = getStateKey(in2);

        deletedRouteState.asyncGet(key)
            .thenCompose(deleted -> routeState.asyncGet(key)
                .thenAccept(route -> handleEvent(key, in2, route, deleted)));
    }


    protected String getStateKey(EnrichedVehiclePosition in1){
        return in1.getTrip().getRouteId() ; 
    }

    /**
     * Remember that the stream is keyed by City hence the route is supposed to be unique by the transport 
     */
    protected String getStateKey(CDCEvent<Route> in2){
        return in2.getObject().getRouteId() ; 
    }
  
    @Override
    public void open(OpenContext ctx) throws Exception {

        // 1. State descriptor for route state 
        MapStateDescriptor<String,CDCEvent<Route>> descriptor = 
            new MapStateDescriptor<>(
                "gtfs-routes",
                TypeInformation.of(String.class),
                TypeInformation.of(new TypeHint<CDCEvent<Route>>() {})
            );
        
        routeState = getRuntimeContext().getMapState(descriptor) ; 
        

        // 2. Deleted route state descriptor 
        StateTtlConfig ttlConfig = StateTtlConfig
            .newBuilder(Duration.ofSeconds(30))
            .setUpdateType(StateTtlConfig.UpdateType.OnCreateAndWrite)
            .setStateVisibility(StateTtlConfig.StateVisibility.NeverReturnExpired)
            .build();

        MapStateDescriptor<String,CDCEvent<Route>> deletedDescriptor = 
            new MapStateDescriptor<>(
                "deleted-gtfs-routes",
                TypeInformation.of(String.class),
                TypeInformation.of(new TypeHint<CDCEvent<Route>>() {})
            );
        deletedDescriptor.enableTimeToLive(ttlConfig);

        deletedRouteState = getRuntimeContext().getMapState(deletedDescriptor) ; 

    }

    // Handler methods 

    private void handleEvent(
            String key,
            CDCEvent<Route> event,
            CDCEvent<Route> routeStateValue,
            CDCEvent<Route> deletedStateValue) {

        if (isShadowedByDelete(event, deletedStateValue)) {
            return;
        }

        switch (event.getRowKind()) {

            case RowKind.DELETE -> handleDelete(key, event, routeStateValue);

            case RowKind.INSERT, RowKind.UPDATE_AFTER ->
                handleUpsert(key, event, routeStateValue);

            case RowKind.UPDATE_BEFORE -> {
                // ignore
            }
        }
    }

    private boolean isShadowedByDelete(
            CDCEvent<Route> event,
            CDCEvent<Route> deletedState) {

        return deletedState != null &&
            event.getRecordTimestamp() <= deletedState.getRecordTimestamp();
    }

    private void handleDelete(
            String key,
            CDCEvent<Route> event,
            CDCEvent<Route> stateValue) {

        if (stateValue == null) {
            deletedRouteState.asyncPut(key, event);
            return;
        }

        if (event.getRecordTimestamp() >= stateValue.getRecordTimestamp()) {
            routeState.asyncRemove(key);
        }
    }


    private void handleUpsert(
            String key,
            CDCEvent<Route> event,
            CDCEvent<Route> stateValue) {

        if (stateValue == null ||
            event.getRecordTimestamp() >= stateValue.getRecordTimestamp()) {

            routeState.asyncPut(key, event);
        }
    }


    public static InvalidRecord<VehiclePosition> buildInvalidRecord(EnrichedVehiclePosition value,List<String> errors){

        VehiclePosition vehiclePosition = (VehiclePosition) value ; 

        InvalidRecord<VehiclePosition> invalidData = InvalidRecord.<VehiclePosition>builder()
                .sourceStep(MethodHandles.lookup().lookupClass().getSimpleName())
                .timestamp(System.currentTimeMillis())
                .errors(errors)
                .payload(vehiclePosition)
                .build();

        return invalidData ; 
    }

}
