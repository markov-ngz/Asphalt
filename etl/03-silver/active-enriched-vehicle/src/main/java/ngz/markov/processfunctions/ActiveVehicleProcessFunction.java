package ngz.markov.processfunctions ; 

import org.apache.flink.api.common.functions.OpenContext;
import org.apache.flink.api.common.state.v2.MapState;
import org.apache.flink.api.common.state.v2.MapStateDescriptor;
import org.apache.flink.api.common.typeinfo.TypeInformation;
import org.apache.flink.streaming.api.functions.KeyedProcessFunction;
import org.apache.flink.util.Collector;
import org.apache.flink.util.OutputTag;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.gtfs.rt.model.Position;

public class ActiveVehicleProcessFunction extends KeyedProcessFunction<String, EnrichedVehiclePosition, EnrichedVehiclePosition> {
    
    private transient MapState<String,EnrichedVehiclePosition> state ;

    private final long MIN_IDLE_TIME ; 

    public ActiveVehicleProcessFunction(long minIdleTime){
        this.MIN_IDLE_TIME = minIdleTime ;
    }

    public final OutputTag<EnrichedVehiclePosition> INACTIVE_TAG = new OutputTag<EnrichedVehiclePosition>("side-output"){};

    @Override
    public void processElement(EnrichedVehiclePosition value,Context context, Collector<EnrichedVehiclePosition> out) throws Exception {

        String valueKey = getStateKeyFromValue(value) ; 

        // 1. Check if the state has the key 
        state.asyncContains(valueKey).thenAccept((Boolean exists) -> {

            // If it exists get the value 
            if(exists){
                // Get the value item
                state.asyncGet(valueKey).thenAccept((EnrichedVehiclePosition stateValue) -> {
                    if(hasVehicleMoved(value, stateValue)){
                        state.asyncPut(valueKey, value) ;
                        // vehicle moved hence pass the record to downstream 
                        out.collect(value);

                    }else if(value.getTimestamp() - stateValue.getTimestamp() > MIN_IDLE_TIME ){
                        context.output(INACTIVE_TAG, value) ; 
                    }
                });
            }else{
                state.asyncPut(valueKey, value) ;
                // as it did not exists in state, collect as it is a new vehicle ( active by default )
                out.collect(value);
            }
        })
        ;
    }

    private String getStateKeyFromValue(EnrichedVehiclePosition value){
        return value.getVehicle().getId() ; 
    }

    private boolean hasVehicleMoved(EnrichedVehiclePosition current, EnrichedVehiclePosition former){
        Position currentPosition = current.getPosition() ; 
        Position formerPosition = former.getPosition() ; 
        
        return 
            currentPosition.getLatitude() != formerPosition.getLatitude()  ||
            currentPosition.getLongitude() != formerPosition.getLongitude()    
        ; 
    }

    @Override
    public void open(OpenContext openContext) throws Exception {

        MapStateDescriptor<String, EnrichedVehiclePosition> descriptor =
                new MapStateDescriptor<>(
                        "vehicle-position", 
                        TypeInformation.of(String.class),
                        TypeInformation.of(EnrichedVehiclePosition.class));
        state = getRuntimeContext().getMapState(descriptor);
    }
    
    
    
}
