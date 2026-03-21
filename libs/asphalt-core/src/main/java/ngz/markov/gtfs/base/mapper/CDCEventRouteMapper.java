package ngz.markov.gtfs.base.mapper ;

import org.apache.flink.types.RowKind;

import ngz.markov.cdc.model.CDCEvent;
import ngz.markov.cdc.proto.CDCEventRouteProtoOuterClass;
import ngz.markov.gtfs.base.model.Route;

public class CDCEventRouteMapper {

    public static CDCEventRouteProtoOuterClass.CDCEvent toProto(CDCEvent<Route> element) {

        // Map Route object
        CDCEventRouteProtoOuterClass.Route protoRoute = null;
        if (element.getObject() != null) {
            Route route = element.getObject();

            protoRoute = CDCEventRouteProtoOuterClass.Route.newBuilder()
                    .setId(route.getId() != null ? route.getId() : 0)
                    .setRouteId(nullToEmpty(route.getRouteId()))
                    .setAgencyId(nullToEmpty(route.getAgencyId()))
                    .setRouteShortName(nullToEmpty(route.getRouteShortName()))
                    .setRouteLongName(nullToEmpty(route.getRouteLongName()))
                    .setRouteDesc(nullToEmpty(route.getRouteDesc()))
                    .setRouteType(route.getRouteType() != null ? route.getRouteType() : 0)
                    .setRouteUrl(nullToEmpty(route.getRouteUrl()))
                    .setRouteColor(nullToEmpty(route.getRouteColor()))
                    .setRouteTextColor(nullToEmpty(route.getRouteTextColor()))
                    .setRouteSortOrder(route.getRouteSortOrder() != null ? route.getRouteSortOrder() : 0)
                    .setUpdatedAt(nullToEmpty(route.getUpdatedAt()))
                    .setSourceCity(nullToEmpty(route.getSourceCity()))
                    .setSourceTransport(nullToEmpty(route.getSourceTransport()))
                    .setOperation(nullToEmpty(route.getOperation()))
                    .setOperationTimestamp(nullToEmpty(route.getOperationTimestamp()))
                    .build();
        }

        return CDCEventRouteProtoOuterClass.CDCEvent.newBuilder()
                .setDatabaseName(nullToEmpty(element.getDatabaseName()))
                .setSchema(nullToEmpty(element.getSchema()))
                .setTable(nullToEmpty(element.getTable()))
                .setRecordTimestamp(element.getRecordTimestamp())
                .setRowKind(toProtoRowKind(element.getRowKind()))
                .setJsonObject(nullToEmpty(element.getJsonObject()))
                .setObject(protoRoute != null ? protoRoute :
                        CDCEventRouteProtoOuterClass.Route.getDefaultInstance())
                .build();
    }

    public static CDCEvent<Route> fromProto(CDCEventRouteProtoOuterClass.CDCEvent proto) {

        CDCEvent<Route> event = new CDCEvent<>();

        event.setDatabaseName(proto.getDatabaseName());
        event.setSchema(proto.getSchema());
        event.setTable(proto.getTable());
        event.setRecordTimestamp(proto.getRecordTimestamp());
        event.setRowKind(fromProtoRowKind(proto.getRowKind()));
        event.setJsonObject(proto.getJsonObject());

        if (proto.hasObject()) {
            CDCEventRouteProtoOuterClass.Route protoRoute = proto.getObject();

            Route route = new Route();
            route.setId(protoRoute.getId());
            route.setRouteId(protoRoute.getRouteId());
            route.setAgencyId(protoRoute.getAgencyId());
            route.setRouteShortName(protoRoute.getRouteShortName());
            route.setRouteLongName(protoRoute.getRouteLongName());
            route.setRouteDesc(protoRoute.getRouteDesc());
            route.setRouteType(protoRoute.getRouteType());
            route.setRouteUrl(protoRoute.getRouteUrl());
            route.setRouteColor(protoRoute.getRouteColor());
            route.setRouteTextColor(protoRoute.getRouteTextColor());
            route.setRouteSortOrder(protoRoute.getRouteSortOrder());
            route.setUpdatedAt(protoRoute.getUpdatedAt());
            route.setSourceCity(protoRoute.getSourceCity());
            route.setSourceTransport(protoRoute.getSourceTransport());
            route.setOperation(protoRoute.getOperation());
            route.setOperationTimestamp(protoRoute.getOperationTimestamp());

            event.setObject(route);
        }

        return event;
    }

    private static CDCEventRouteProtoOuterClass.RowKind toProtoRowKind(RowKind rowKind) {
        if (rowKind == null) {
            return CDCEventRouteProtoOuterClass.RowKind.ROW_KIND_UNSPECIFIED;
        }

        return switch (rowKind) {
            case INSERT -> CDCEventRouteProtoOuterClass.RowKind.INSERT;
            case UPDATE_BEFORE -> CDCEventRouteProtoOuterClass.RowKind.UPDATE_BEFORE;
            case UPDATE_AFTER -> CDCEventRouteProtoOuterClass.RowKind.UPDATE_AFTER;
            case DELETE -> CDCEventRouteProtoOuterClass.RowKind.DELETE;
        };
    }

    private static RowKind fromProtoRowKind(CDCEventRouteProtoOuterClass.RowKind rowKind) {
        return switch (rowKind) {
            case INSERT -> RowKind.INSERT;
            case UPDATE_BEFORE -> RowKind.UPDATE_BEFORE;
            case UPDATE_AFTER -> RowKind.UPDATE_AFTER;
            case DELETE -> RowKind.DELETE;
            case ROW_KIND_UNSPECIFIED -> null;
            default -> null ;
        };
    }

    private static String nullToEmpty(String value) {
        return value == null ? "" : value;
    }
}