package ngz.markov.gtfs.rt.mapper; 

import java.util.function.Consumer;

import ngz.markov.gtfs.rt.exceptions.VehiclePositionProtoValueError;
import ngz.markov.gtfs.rt.exceptions.VehiclePositionValueError;
import ngz.markov.gtfs.rt.model.Position;
import ngz.markov.gtfs.rt.model.Trip;
import ngz.markov.gtfs.rt.model.Vehicle;
import ngz.markov.gtfs.rt.model.VehiclePosition;
import ngz.markov.gtfs.rt.proto.VehiclePositionOuterClass;

public final class VehiclePositionProtoMapper {

    private VehiclePositionProtoMapper() {
        // utility class
    }

    // ============================================================
    // ========================= TO PROTO =========================
    // ============================================================

    public static VehiclePositionOuterClass.VehiclePosition toProto(
            VehiclePosition vehiclePosition
    ) throws VehiclePositionValueError {
        if (vehiclePosition == null) {
            return null ; 
        }
        VehiclePositionOuterClass.VehiclePosition.Builder builder =
                VehiclePositionOuterClass.VehiclePosition.newBuilder();

        // SafeVehicleProtoBuilder safeBuilder = new SafeVehicleProtoBuilder(builder) ; 

        mapSimpleFieldsToProto(vehiclePosition, builder);
        mapTripToProto(vehiclePosition, builder);
        mapPositionToProto(vehiclePosition, builder);
        mapVehicleToProto(vehiclePosition, builder);

        return builder.build();
    }

    // ---------- Simple fields ----------
    private static void mapSimpleFieldsToProto(
            VehiclePosition vehiclePosition,
            VehiclePositionOuterClass.VehiclePosition.Builder builder
    ) throws VehiclePositionValueError {

        setIfNotNull(builder::setCurrentStatus, vehiclePosition.getCurrentStatus());
        setIfNotNull(builder::setTimestamp, vehiclePosition.getTimestamp());
        setIfNotNull(builder::setStopId, vehiclePosition.getStopId());
        setIfNotNull(builder::setTransport, vehiclePosition.getTransport());
        setIfNotNull(builder::setCity, vehiclePosition.getCity());
    }

    // ---------- Trip ----------

    private static void mapTripToProto(
            VehiclePosition vehiclePosition,
            VehiclePositionOuterClass.VehiclePosition.Builder builder
    ) throws VehiclePositionValueError {

        Trip trip = vehiclePosition.getTrip();

        if (trip != null) {
            VehiclePositionOuterClass.VehiclePosition.Trip.Builder tripBuilder =
                    VehiclePositionOuterClass.VehiclePosition.Trip.newBuilder();

            setIfNotNull(tripBuilder::setTripId, trip.getTripId());
            setIfNotNull(tripBuilder::setScheduleRelationship, trip.getScheduleRelationship());
            setIfNotNull(tripBuilder::setRouteId, trip.getRouteId());
            setIfNotNull(tripBuilder::setDirectionId, trip.getDirectionId());

            builder.setTrip(tripBuilder.build());
        }
    }

    // ---------- Position ----------

    private static void mapPositionToProto(
            VehiclePosition vehiclePosition,
            VehiclePositionOuterClass.VehiclePosition.Builder builder
    ) throws VehiclePositionValueError {

        Position position = vehiclePosition.getPosition();

        if (position != null) {

            VehiclePositionOuterClass.VehiclePosition.Position.Builder positionBuilder =
                    VehiclePositionOuterClass.VehiclePosition.Position.newBuilder();

            setIfNotNull(positionBuilder::setLatitude, position.getLatitude());
            setIfNotNull(positionBuilder::setLongitude, position.getLongitude());
            setIfNotNull(positionBuilder::setBearing, position.getBearing());
            setIfNotNull(positionBuilder::setSpeed, position.getSpeed());

            builder.setPosition(positionBuilder.build());
        }
    }

    // ---------- Vehicle ----------

    private static void mapVehicleToProto(
            VehiclePosition vehiclePosition,
            VehiclePositionOuterClass.VehiclePosition.Builder builder
    ) throws VehiclePositionValueError {

        Vehicle vehicle = vehiclePosition.getVehicle();

        if (vehicle != null) {

            VehiclePositionOuterClass.VehiclePosition.Vehicle.Builder vehicleBuilder =
                    VehiclePositionOuterClass.VehiclePosition.Vehicle.newBuilder();

            setIfNotNull(vehicleBuilder::setId, vehicle.getId());
            setIfNotNull(vehicleBuilder::setLabel, vehicle.getLabel());

            builder.setVehicle(vehicleBuilder.build());
        }
    }
    // ============================================================
    // ======================== FROM PROTO ========================
    // ============================================================

    public static VehiclePosition fromProto(
            VehiclePositionOuterClass.VehiclePosition proto
    ) throws VehiclePositionProtoValueError {
        if (proto == null || proto.equals(VehiclePositionOuterClass.VehiclePosition.getDefaultInstance())) {
            throw new VehiclePositionProtoValueError("VehiclePosition proto is null or default instance");
        }

        VehiclePosition vehiclePosition = new VehiclePosition();

        mapSimpleFieldsFromProto(proto, vehiclePosition);
        mapTripFromProto(proto, vehiclePosition);
        mapPositionFromProto(proto, vehiclePosition);
        mapVehicleFromProto(proto, vehiclePosition);

        return vehiclePosition;
    }

    // ---------- Simple fields ----------

    private static void mapSimpleFieldsFromProto(
            VehiclePositionOuterClass.VehiclePosition proto,
            VehiclePosition target
    )  throws VehiclePositionProtoValueError {

        target.setCurrentStatus(proto.getCurrentStatus());
        target.setTimestamp(proto.getTimestamp());
        target.setStopId(proto.getStopId());
        target.setTransport(proto.getTransport());
        target.setCity(proto.getCity());
    }

    // ---------- Trip ----------

    private static void mapTripFromProto(
            VehiclePositionOuterClass.VehiclePosition proto,
            VehiclePosition target
    )  throws VehiclePositionProtoValueError {
        if (!proto.hasTrip()) {
            throw new VehiclePositionProtoValueError("Missing required field: trip");
        }

        VehiclePositionOuterClass.VehiclePosition.Trip protoTrip = proto.getTrip();
        Trip trip = new Trip();

        trip.setTripId(protoTrip.getTripId());
        trip.setScheduleRelationship(protoTrip.getScheduleRelationship());
        trip.setRouteId(protoTrip.getRouteId());
        trip.setDirectionId(protoTrip.getDirectionId());

        target.setTrip(trip);
    }

    // ---------- Position ----------

    private static void mapPositionFromProto(
            VehiclePositionOuterClass.VehiclePosition proto,
            VehiclePosition target
    )  throws VehiclePositionProtoValueError {
        if (!proto.hasPosition()) {
            throw new VehiclePositionProtoValueError("Missing required field: position");
        }

        VehiclePositionOuterClass.VehiclePosition.Position protoPosition = proto.getPosition();
        Position position = new Position();

        position.setLatitude(protoPosition.getLatitude());
        position.setLongitude(protoPosition.getLongitude());
        position.setBearing(protoPosition.getBearing());
        position.setSpeed(protoPosition.getSpeed());

        target.setPosition(position);
    }

    // ---------- Vehicle ----------

    private static void mapVehicleFromProto(
            VehiclePositionOuterClass.VehiclePosition proto,
            VehiclePosition target
    )  throws VehiclePositionProtoValueError {
        if (!proto.hasVehicle()) {
            throw new VehiclePositionProtoValueError("Missing required field: vehicle");
        }

        VehiclePositionOuterClass.VehiclePosition.Vehicle protoVehicle = proto.getVehicle();
        Vehicle vehicle = new Vehicle();

        vehicle.setId(protoVehicle.getId());
        vehicle.setLabel(protoVehicle.getLabel());
        target.setVehicle(vehicle);
    }

    // Helper method
    private static <T> void setIfNotNull(Consumer<T> setter, T value) {
        if (value != null) {
            setter.accept(value);
        }
    }
}