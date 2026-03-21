package ngz.markov.schemas;

import java.util.ArrayList;
import java.util.Collection;

import com.google.transit.realtime.GtfsRealtime;

import ngz.markov.exceptions.GtfsRtVehiclePositionValueError;
import ngz.markov.gtfs.rt.model.Position;
import ngz.markov.gtfs.rt.model.Trip;
import ngz.markov.gtfs.rt.model.Vehicle;
import ngz.markov.gtfs.rt.model.VehiclePosition;

public class VehiclePositionMapper {

    public static Collection<VehiclePosition> fromGtfsFeedMessage(
            String transport,
            String city,
            GtfsRealtime.FeedMessage feedMessage
    ) throws GtfsRtVehiclePositionValueError {
        if (feedMessage == null) {
            throw new GtfsRtVehiclePositionValueError("FeedMessage is null for city: " + city);
        }

        Collection<VehiclePosition> collection = new ArrayList<>();

        for (GtfsRealtime.FeedEntity feedEntity : feedMessage.getEntityList()) {
            // Skip entities that aren't vehicle positions (like Alert or TripUpdate)
            if (!feedEntity.hasVehicle()) {
                continue;
            }

            try {
                VehiclePosition vp = fromGtfsVehiclePosition(transport, city, feedEntity.getVehicle());
                collection.add(vp);
            } catch (Exception e) {
                // Wrap and rethrow with entity ID for easier debugging
                throw new GtfsRtVehiclePositionValueError(
                    String.format("Failed to map Entity ID %s in city %s: %s", 
                    feedEntity.getId(), city, e.getMessage())
                );
            }
        }
        return collection;
    }

    public static VehiclePosition fromGtfsVehiclePosition(
            String transport,
            String city,
            GtfsRealtime.VehiclePosition gtfsVp
    ) throws GtfsRtVehiclePositionValueError{
        if (gtfsVp == null) {
            throw new GtfsRtVehiclePositionValueError("Provided GtfsRealtime.VehiclePosition is null");
        }

        // Validation: GTFS-RT is useless for your Flink windows without a timestamp
        if (!gtfsVp.hasTimestamp() || gtfsVp.getTimestamp() == 0) {
            throw new GtfsRtVehiclePositionValueError("VehiclePosition missing mandatory timestamp");
        }

        VehiclePosition source = new VehiclePosition();
        source.setTransport(transport);
        source.setCity(city);
        source.setTimestamp(gtfsVp.getTimestamp());

        // Map sub-objects with validation
        source.setTrip(mapTrip(gtfsVp));
        source.setPosition(mapPosition(gtfsVp));
        source.setVehicle(mapVehicle(gtfsVp));

        source.setCurrentStatus(gtfsVp.hasCurrentStatus() ? gtfsVp.getCurrentStatus().name() : null);
        source.setStopId(gtfsVp.hasStopId() ? gtfsVp.getStopId() : null);

        return source;
    }

    private static Trip mapTrip(GtfsRealtime.VehiclePosition gtfsVp)
        throws GtfsRtVehiclePositionValueError {
        
            if (!gtfsVp.hasTrip()) throw new GtfsRtVehiclePositionValueError("VehiclePosition missing Trip data");
        
        GtfsRealtime.TripDescriptor td = gtfsVp.getTrip();
        Trip trip = new Trip();

        trip.setTripId(td.getTripId());
        trip.setRouteId(td.getRouteId());
        if (td.hasDirectionId()) trip.setDirectionId(td.getDirectionId());
        if (td.hasScheduleRelationship()) {
            trip.setScheduleRelationship(td.getScheduleRelationship().name());
        }
        return trip;
    }

    private static Position mapPosition(GtfsRealtime.VehiclePosition gtfsVp) throws GtfsRtVehiclePositionValueError {
        if (!gtfsVp.hasPosition()) {
            throw new GtfsRtVehiclePositionValueError("VehiclePosition missing Position data");
        }

        GtfsRealtime.Position gp = gtfsVp.getPosition();
        Position pos = new Position();

        // Coordinates are essential
        pos.setLatitude(gp.getLatitude());
        pos.setLongitude(gp.getLongitude());

        if (gp.hasBearing()) pos.setBearing(gp.getBearing());
        if (gp.hasSpeed()) pos.setSpeed(gp.getSpeed());

        return pos;
    }

    private static Vehicle mapVehicle(GtfsRealtime.VehiclePosition gtfsVp) throws GtfsRtVehiclePositionValueError  {
        if (!gtfsVp.hasVehicle()) throw new GtfsRtVehiclePositionValueError("VehiclePosition missing Vehicle data");

        GtfsRealtime.VehicleDescriptor vd = gtfsVp.getVehicle();
        Vehicle v = new Vehicle();
        v.setId(vd.getId());
        v.setLabel(vd.getLabel());
        return v;
    }
}