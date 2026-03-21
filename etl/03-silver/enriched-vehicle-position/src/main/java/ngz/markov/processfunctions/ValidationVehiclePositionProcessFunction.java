package ngz.markov.processfunctions ; 

import java.lang.invoke.MethodHandles;

import org.apache.flink.streaming.api.functions.ProcessFunction;
import org.apache.flink.util.Collector;
import org.apache.flink.util.OutputTag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

import ngz.markov.quality.model.InvalidRecord;
import ngz.markov.gtfs.rt.model.VehiclePosition;

/**
 * 
 * https://nightlies.apache.org/flink/flink-docs-stable/api/java/org/apache/flink/api/common/functions/RichFilterFunction.html
 */
public class ValidationVehiclePositionProcessFunction extends ProcessFunction<VehiclePosition, VehiclePosition> {

    public final OutputTag<InvalidRecord<VehiclePosition>> REJECTED_TAG = new OutputTag<InvalidRecord<VehiclePosition>>("side-output"){};

    private static final Logger LOG = LoggerFactory.getLogger(ValidationVehiclePositionProcessFunction.class);
    
    @Override
    public void processElement(VehiclePosition value,Context ctx, Collector<VehiclePosition> out){

        // Get the list of validation errors 
        List<String> errors = getValidationErrors(value);

        if (errors.isEmpty()) {
            // send to clean data if there is no errors 
            out.collect(value);
        } else {

            // send to side output topic to save them 
            ctx.output(REJECTED_TAG, buildInvalidRecord(value, errors));
        }
    }

    /**
     * Checks mandatory fields for VehiclePosition
     */
    public static List<String> getValidationErrors(VehiclePosition v) {

        List<String> errors = new ArrayList<>();
        
        // Basic fields checking 
        check(v.getCity(), "city", errors);
        check(v.getTransport(), "transport", errors);
        check(v.getTimestamp(), "timestamp", errors);
        
        // Vehicle
        if (v.getVehicle() == null) {
            errors.add("vehicle is missing");
        } else {
            check(v.getVehicle().getId(), "vehicle.id", errors);
        }

        // Position 
        if(v.getPosition()  == null ){
            errors.add("position is missing");
        } else {
            check(v.getPosition().getLatitude(), "position.latitude", errors);
            check(v.getPosition().getLongitude(), "position.longitude", errors);
        }

        // Trip 
        if(v.getTrip() == null){
            errors.add("trip is missing");
        } else {
            check(v.getTrip().getRouteId(), "trip.routeid", errors);
        }
        
        return errors;
    }

    private static void check(String val, String name, List<String> errs) {
        if (val == null || val.trim().isEmpty()) {
            errs.add(name + " is invalid");
        }
    }
    private static void check(double val, String name, List<String> errs) {
        if (val == 0D ) {
            errs.add(name + " is invalid");
        }
    }

    public static InvalidRecord<VehiclePosition> buildInvalidRecord(VehiclePosition value,List<String> errors){
        InvalidRecord<VehiclePosition> invalidData = InvalidRecord.<VehiclePosition>builder()
                .sourceStep(MethodHandles.lookup().lookupClass().getSimpleName())
                .timestamp(System.currentTimeMillis())
                .errors(errors)
                .payload(value)
                .build();

        return invalidData ; 
    }

}
