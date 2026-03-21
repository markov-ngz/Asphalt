package ngz.markov.gtfs.rt.mapper; 

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import ngz.markov.gtfs.rt.model.EnrichedVehiclePosition;
import ngz.markov.gtfs.rt.model.Position;
import ngz.markov.gtfs.rt.model.Trip;
import ngz.markov.gtfs.rt.model.Vehicle;
import ngz.markov.gtfs.rt.proto.VehiclePositionOuterClass;

public class EnrichedVehiclePositionMapperTest {
    @BeforeEach
    void setUp() {
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
    @DisplayName("toProto() should return a valid EnrichedVehiclePosition proto for first fixture (IN_TRANSIT_TO)")
    void testToProtoFirstFixtureReturnsValidProto() {
        // Arrange
        EnrichedVehiclePosition element = buildFirstFixture();

        // Act & Assert
        assertDoesNotThrow(() -> {
            VehiclePositionOuterClass.EnrichedVehiclePosition result = EnrichedVehiclePositionMapper.toProto(element);

            // Optionally, add assertions to verify the content of the result
            assertNotNull(result, "Result should not be null");
            assertEquals("361", result.getVehiclePosition().getVehicle().getId(), "Vehicle ID should match");
            assertEquals("6-0006", result.getVehiclePosition().getTrip().getRouteId(), "Route ID should match");
            // Add more assertions as needed for other fields
        }, "toProto() should not throw an exception for valid input");
    }


}
