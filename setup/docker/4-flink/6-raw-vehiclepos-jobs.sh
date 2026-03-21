#  1. Extraction of Star Rennes 

RAW_GTFSVEHICLEPOS_JAR_FOLDER=$ROOT_REPO_DIR/etl/01-raw-data/gtfsrt-vehicleposition/target
RAW_GTFSVEHICLEPOS_JAR_FILE=raw-gtfsrt-vehicleposition-0.1.0.jar


docker cp $RAW_GTFSVEHICLEPOS_JAR_FOLDER/$RAW_GTFSVEHICLEPOS_JAR_FILE $FLINK_JOBMANAGER_CONTAINERNAME:$FLINK_JOB_DIR

docker exec -it $FLINK_JOBMANAGER_CONTAINERNAME flink run -d \
  $FLINK_JOB_DIR/$RAW_GTFSVEHICLEPOS_JAR_FILE \
  --pipeline.name "Raw - GtfsRt VehiclePosition- Rennes Star" \
  --gtfs.source.url $GTFS_RENNES_SOURCE_URL \
  --gtfs.source.transport star \
  --gtfs.source.city rennes \
  --kafka.bootstrap.servers $KAFKA_BOOTSTRAP_SERVERS \
  --kafka.topic $TOPIC_RAW_GTFSRT_VEHICLEPOSITION \
  --poll.interval.ms $POLL_INTERVAL_MS

docker exec -it $FLINK_JOBMANAGER_CONTAINERNAME flink run -d \
  $FLINK_JOB_DIR/$RAW_GTFSVEHICLEPOS_JAR_FILE \
  --pipeline.name "Raw - GtfsRt VehiclePosition - Bordeaux TBM" \
  --gtfs.source.url $GTFS_BDX_SOURCE_URL \
  --gtfs.source.transport tbm \
  --gtfs.source.city bordeaux \
  --kafka.bootstrap.servers $KAFKA_BOOTSTRAP_SERVERS \
  --kafka.topic $TOPIC_RAW_GTFSRT_VEHICLEPOSITION \
  --poll.interval.ms $POLL_INTERVAL_MS
