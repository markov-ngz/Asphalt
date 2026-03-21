# Gold : Traffic Metrics 

export GOLD_TRAFFIC_JAR_FOLDER=$ROOT_REPO_DIR/etl/04-gold/traffic-metrics/target
export GOLD_TRAFFIC_JAR_FILE=gold-traffic-metrics-0.1.0.jar


docker cp $GOLD_TRAFFIC_JAR_FOLDER/$GOLD_TRAFFIC_JAR_FILE $FLINK_JOBMANAGER_CONTAINERNAME:$FLINK_JOB_DIR

docker exec -it $FLINK_JOBMANAGER_CONTAINERNAME flink run -d \
  $FLINK_JOB_DIR/$GOLD_TRAFFIC_JAR_FILE \
  --kafka.bootstrap.servers $KAFKA_BOOTSTRAP_SERVERS \
  --kafka.source.topic $TOPIC_SILVER_ENRICHED_VEHICLE_POSITION \
  --kafka.source.groupId $KAFKA_GROUPID \
  --kafka.sink.topic.avgspeed $TOPIC_GOLD_AVG_SPEEDRESULT \
  --kafka.sink.topic.countvehicle $TOPIC_GOLD_COUNT_ACTIVEVEHICLE \
  --kafka.sink.topic.maxvehiclespeed $TOPIC_GOLD_MAX_VEHICLESPEED