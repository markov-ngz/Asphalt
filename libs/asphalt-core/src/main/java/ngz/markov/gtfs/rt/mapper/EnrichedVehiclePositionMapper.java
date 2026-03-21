package ngz.markov.gtfs.rt.mapper ;

import java.util.function.Consumer;

import ngz.markov.gtfs.rt.exceptions.VehiclePositionProtoValueError;
import ngz.markov.gtfs.rt.exceptions.VehiclePositionValueError;
import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.gtfs.rt.proto.VehiclePositionOuterClass;

public class EnrichedVehiclePositionMapper {

    public static EnrichedVehiclePosition fromSuper(VehiclePosition vehiclePosition) {
        if (vehiclePosition == null) {
            return null;
        }

        EnrichedVehiclePosition enriched = new EnrichedVehiclePosition();

        // Copy inherited fields
        enriched.setTrip(vehiclePosition.getTrip());
        enriched.setPosition(vehiclePosition.getPosition());
        enriched.setCurrentStatus(vehiclePosition.getCurrentStatus());
        enriched.setTimestamp(vehiclePosition.getTimestamp());
        enriched.setStopId(vehiclePosition.getStopId());
        enriched.setVehicle(vehiclePosition.getVehicle());
        enriched.setTransport(vehiclePosition.getTransport());
        enriched.setCity(vehiclePosition.getCity());

        return enriched;
    }
    
    public static EnrichedVehiclePosition fromProto(VehiclePositionOuterClass.EnrichedVehiclePosition proto) throws VehiclePositionProtoValueError{
        
        // Use base protobuf mapper from basic class
        VehiclePosition vehiclePosition =  VehiclePositionProtoMapper.fromProto(proto.getVehiclePosition()) ; 
        
        // Cast to child class 
        EnrichedVehiclePosition enrichedVehiclePosition = fromSuper(vehiclePosition) ; 

        // Map enrichment fields
        enrichedVehiclePosition.setRouteShortName(proto.getRouteShortName());
        enrichedVehiclePosition.setRouteLongName(proto.getRouteLongName());
        enrichedVehiclePosition.setRouteDesc(proto.getRouteDesc()) ;
        enrichedVehiclePosition.setRouteType(proto.getRouteType()) ; 
        return enrichedVehiclePosition ;
    }


    public static VehiclePositionOuterClass.EnrichedVehiclePosition toProto(EnrichedVehiclePosition enrichedVehiclePosition) throws VehiclePositionValueError {
        VehiclePositionOuterClass.VehiclePosition protoVehiclePosition = VehiclePositionProtoMapper.toProto((VehiclePosition) enrichedVehiclePosition);

        VehiclePositionOuterClass.EnrichedVehiclePosition.Builder builder =
            VehiclePositionOuterClass.EnrichedVehiclePosition.newBuilder()
                .setVehiclePosition(protoVehiclePosition);

        setIfNotNull(builder::setRouteShortName, enrichedVehiclePosition.getRouteShortName());
        setIfNotNull(builder::setRouteLongName, enrichedVehiclePosition.getRouteLongName());
        setIfNotNull(builder::setRouteDesc, enrichedVehiclePosition.getRouteDesc());
        setIfNotNull(builder::setRouteType, enrichedVehiclePosition.getRouteType());

        return builder.build();
    }

    // Helper method
    private static <T> void setIfNotNull(Consumer<T> setter, T value) {
        if (value != null) {
            setter.accept(value);
        }
    }
}
