package ngz.markov.sinks; // adjust to your package

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.gtfs.rt.model.Position;
import ngz.markov.gtfs.rt.model.Trip;
import ngz.markov.gtfs.rt.model.Vehicle;
import ngz.markov.gtfs.rt.proto.VehiclePositionOuterClass;

class EnrichedVehiclePositionSerializationSchemaTest {

    private EnrichedVehiclePositionSerializationSchema schema;

    @BeforeEach
    void setUp() {
        schema = new EnrichedVehiclePositionSerializationSchema();
    }

    private EnrichedVehiclePosition buildFirstFixture() {
        Trip trip = new Trip();
        trip.setTripId("26_SAMEDI-16993534");
        trip.setScheduleRelationship("SCHEDULED");
        trip.setRouteId("6-0006");
        trip.setDirectionId(0);

        Position position = new Position();
        position.setLatitude(48.10664749145508f);
        position.setLongitude(-1.680724024772644f);
        position.setBearing(201.0f);
        position.setSpeed(6.111100196838379f);

        Vehicle vehicle = new Vehicle();
        vehicle.setId("361");
        vehicle.setLabel("361");

        EnrichedVehiclePosition evp = new EnrichedVehiclePosition();
        evp.setTrip(trip);
        evp.setPosition(position);
        evp.setCurrentStatus("IN_TRANSIT_TO");
        evp.setTimestamp(1772269301L);
        evp.setStopId("6-1018");
        evp.setVehicle(vehicle);
        evp.setTransport("star");
        evp.setCity("rennes");

        return evp;
    }

    @Test
    @DisplayName("serialize() should return non-null bytes for first fixture (IN_TRANSIT_TO)")
    void testSerializeFirstFixtureReturnsNonNull() {
        EnrichedVehiclePosition element = buildFirstFixture();
        byte[] result = schema.serialize(element);
        assertNotNull(result, "serialize() must not return null for a valid EnrichedVehiclePosition");
    }

    @Test
    @DisplayName("serialize() should return non-empty bytes for first fixture (IN_TRANSIT_TO)")
    void testSerializeFirstFixtureReturnsNonEmptyBytes() {
        EnrichedVehiclePosition element = buildFirstFixture();
        byte[] result = schema.serialize(element);
        assertNotNull(result);
        assertTrue(result.length > 0, "Serialized bytes must not be empty");
    }


    @Test
    @DisplayName("serialize() output should be deserializable back to proto for first fixture")
    void testSerializeFirstFixtureIsDeserializable() throws Exception {
        EnrichedVehiclePosition element = buildFirstFixture();
        byte[] result = schema.serialize(element);
        assertNotNull(result);
        // Verify the bytes can be parsed back as a valid protobuf message
        VehiclePositionOuterClass.EnrichedVehiclePosition parsed =
                VehiclePositionOuterClass.EnrichedVehiclePosition.parseFrom(result);
        assertNotNull(parsed);
    }


    @Test
    @DisplayName("serialize() should return null when element is null (graceful error handling)")
    void testSerializeNullElementReturnsNull() {
        byte[] result = schema.serialize(null);
        assertNull(result, "serialize() should return null when serialization fails due to null input");
    }
}