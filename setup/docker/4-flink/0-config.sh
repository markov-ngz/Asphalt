# 1. Flink containers & project related dirs 

export FLINK_JOBMANAGER_CONTAINERNAME=flink-jobmanager
export FLINK_CDC_JOBMANAGER_CONTAINERNAME=flink-cdc-postgres-jobmanager
export FLINK_JOB_DIR=/opt/flink/usrlib

# make usrlib dir 
docker exec -it $FLINK_CDC_JOBMANAGER_CONTAINERNAME mkdir $FLINK_JOB_DIR
docker exec -it $FLINK_JOBMANAGER_CONTAINERNAME mkdir $FLINK_JOB_DIR

# Set the path to the .jar of the project
export ROOT_REPO_DIR=../../..

# Jar job for sql jobs 
export SQL_RUNNER_JAR=/opt/flink/usrlib/flink-sql-runner-0.1.0.jar

# 2. Job configurations

source ../1-kafka/0-topics_name.sh

export KAFKA_BOOTSTRAP_SERVERS=kafka:29092
export KAFKA_GROUPID=flink-group

# 1 - Raw : Gtfs Rt Vehicle Position
export GTFS_RENNES_SOURCE_URL=https://proxy.transport.data.gouv.fr/resource/star-rennes-integration-gtfs-rt-vehicle-position
export GTFS_BDX_SOURCE_URL=https://bdx.mecatran.com/utw/ws/gtfsfeed/vehicles/bordeaux?apiKey=opendata-bordeaux-metropole-flux-gtfs-rt
export POLL_INTERVAL_MS=30000

# 5 - Export : 
export EXPORT_SOURCE_TOPIC_PATTERN=dev.gold.*