# Silver :  Enriched Vehicle Position 

export SILVER_ENRICHMENT_JAR_FOLDER=$ROOT_REPO_DIR/etl/03-silver/enriched-vehicle-position/target
export SILVER_ENRICHMENT_JAR_FILE=silver-enriched-vehicle-position-0.1.0.jar


docker cp $SILVER_ENRICHMENT_JAR_FOLDER/$SILVER_ENRICHMENT_JAR_FILE $FLINK_JOBMANAGER_CONTAINERNAME:$FLINK_JOB_DIR

docker exec -it $FLINK_JOBMANAGER_CONTAINERNAME flink run -d \
  $FLINK_JOB_DIR/$SILVER_ENRICHMENT_JAR_FILE \
  --kafka.bootstrap.servers $KAFKA_BOOTSTRAP_SERVERS \
  --kafka.source.topic $TOPIC_BRONZE_VEHICLE_POSITION \
  --kafka.enrichment.topic $TOPIC_BRONZE_CDCEVENT_ROUTE \
  --kafka.source.groupId $KAFKA_GROUPID \
  --kafka.sink.topic $TOPIC_SILVER_ENRICHED_VEHICLE_POSITION \
  --kafka.sink.topic.validationerrors $TOPIC_SILVER_INVALID_VEHICLE_POSITION


export SILVER_ACTIVEVEHICLE_JAR_FOLDER=$ROOT_REPO_DIR/etl/03-silver/active-enriched-vehicle/target
export SILVER_ACTIVEVEHICLE_JAR_FILE=silver-active-enriched-vehicle-0.1.0.jar


docker cp $SILVER_ACTIVEVEHICLE_JAR_FOLDER/$SILVER_ACTIVEVEHICLE_JAR_FILE $FLINK_JOBMANAGER_CONTAINERNAME:$FLINK_JOB_DIR

docker exec -it $FLINK_JOBMANAGER_CONTAINERNAME flink run -d \
  $FLINK_JOB_DIR/$SILVER_ACTIVEVEHICLE_JAR_FILE \
  --pipeline.name "Silver - Active Vehicles"\
  --kafka.bootstrap.servers $KAFKA_BOOTSTRAP_SERVERS \
  --kafka.source.topic $TOPIC_SILVER_ENRICHED_VEHICLE_POSITION \
  --kafka.source.groupId $KAFKA_GROUPID \
  --kafka.sink.topic.activevehicle $TOPIC_SILVER_ACTIVE_VEHICLE_POSITION \
  --kafka.sink.topic.inactivevehicle $TOPIC_SILVER_INACTIVE_VEHICLE_POSITION \
  --rules.vehicle.idletime 10000
