# Bronze :  Vehicle Position 

export BRONZE_VEHICLEPOS_JAR_FOLDER=$ROOT_REPO_DIR/etl/02-bronze/vehicle-position/target
export BRONZE_VEHICLEPOS_JAR_FILE=bronze-vehicle-position-0.1.0.jar


docker cp $BRONZE_VEHICLEPOS_JAR_FOLDER/$BRONZE_VEHICLEPOS_JAR_FILE $FLINK_JOBMANAGER_CONTAINERNAME:$FLINK_JOB_DIR

docker exec -it $FLINK_JOBMANAGER_CONTAINERNAME flink run -d \
  $FLINK_JOB_DIR/$BRONZE_VEHICLEPOS_JAR_FILE \
  --pipeline.name "Bronze - VehiclePosition " \
  --kafka.bootstrap.servers $KAFKA_BOOTSTRAP_SERVERS \
  --kafka.source.topic "$TOPIC_RAW_GTFSRT_VEHICLEPOSITION" \
  --kafka.source.groupId $KAFKA_GROUPID \
  --kafka.sink.topic $TOPIC_BRONZE_VEHICLE_POSITION


# Bronze :  CDC Event Route 
export BRONZE_CDCEVENTROUTE_JAR_FOLDER=$ROOT_REPO_DIR/etl/02-bronze/cdcevent-route/target
export BRONZE_CDCEVENTROUTE_JAR_FILE=bronze-cdcevent-route-0.1.0.jar

docker cp $BRONZE_CDCEVENTROUTE_JAR_FOLDER/$BRONZE_CDCEVENTROUTE_JAR_FILE $FLINK_JOBMANAGER_CONTAINERNAME:$FLINK_JOB_DIR

docker exec -it $FLINK_JOBMANAGER_CONTAINERNAME flink run -d \
  $FLINK_JOB_DIR/$BRONZE_CDCEVENTROUTE_JAR_FILE \
  --kafka.bootstrap.servers $KAFKA_BOOTSTRAP_SERVERS \
  --kafka.source.topic $TOPIC_RAW_CDCEVENT_ROUTE \
  --kafka.source.groupId $KAFKA_GROUPID \
  --kafka.sink.topic $TOPIC_BRONZE_CDCEVENT_ROUTE