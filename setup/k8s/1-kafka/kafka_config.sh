# 1. Generic configs

export KAFKA_DIR=/opt/kafka
export BOOTSTRAP_SERVER=kafka.asphalt.svc.cluster.local:29092
export KAFKA_POD=$(kubectl get pod -l app=kafka -o name -n asphalt)


# 2. List of topics used for the project 

# Raw 
export TOPIC_RAW_GTFSRT_VEHICLEPOSITION="dev.raw.gtfsrt-vehicleposition.v1"
export TOPIC_RAW_CDCEVENT_ROUTE="dev.raw.cdcevent.route.v1"

# Bronze 
export TOPIC_BRONZE_VEHICLE_POSITION="dev.bronze.vehicleposition.v1"
export TOPIC_BRONZE_CDCEVENT_ROUTE="dev.bronze.cdcevent.route.v1"

# Silver
export TOPIC_SILVER_ENRICHED_VEHICLE_POSITION="dev.silver.enriched-vehicleposition.v1"
export TOPIC_SILVER_INVALID_VEHICLE_POSITION="dev.silver.invalid-vehicleposition.v1"
export TOPIC_SILVER_ACTIVE_VEHICLE_POSITION="dev.silver.active-vehicleposition.v1"
export TOPIC_SILVER_INACTIVE_VEHICLE_POSITION="dev.silver.inactive-vehicleposition.v1"

# Gold 
export TOPIC_GOLD_AVG_SPEEDRESULT="dev.gold.avg-speedresult.v1"
export TOPIC_GOLD_COUNT_ACTIVEVEHICLE="dev.gold.count-activevehicle.v1"
export TOPIC_GOLD_MAX_VEHICLESPEED="dev.gold.max-vehiclespeed.v1"




# build as list 
export TOPICS=(
    $TOPIC_RAW_GTFSRT_VEHICLEPOSITION
    $TOPIC_RAW_CDCEVENT_ROUTE
    $TOPIC_BRONZE_VEHICLE_POSITION
    $TOPIC_BRONZE_CDCEVENT_ROUTE
    $TOPIC_SILVER_ENRICHED_VEHICLE_POSITION
    $TOPIC_SILVER_INVALID_VEHICLE_POSITION
    $TOPIC_SILVER_ACTIVE_VEHICLE_POSITION
    $TOPIC_SILVER_INACTIVE_VEHICLE_POSITION
    $TOPIC_GOLD_AVG_SPEEDRESULT
    $TOPIC_GOLD_COUNT_ACTIVEVEHICLE
    $TOPIC_GOLD_MAX_VEHICLESPEED
)