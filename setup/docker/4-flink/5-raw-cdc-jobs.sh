# Extraction of CDC events 

# NOTE : it is deployed before the extraction of gtfs vehicle pos as it allows to populate the state from silver enrichment before processing any records

SQL_FILE_DIR=$ROOT_REPO_DIR/etl/01-raw-data/erpcompany-cdcevent-route/
SQL_FILE=postgres-to-kafka.sql

docker cp $SQL_FILE_DIR/$SQL_FILE $FLINK_CDC_JOBMANAGER_CONTAINERNAME:$FLINK_JOB_DIR

docker exec -it $FLINK_CDC_JOBMANAGER_CONTAINERNAME flink run -d \
  $SQL_RUNNER_JAR \
  --jinja.args.hostname erpcompany_db \
  --jinja.args.port 5432 \
  --jinja.args.username kakarott \
  --jinja.args.secrets.password raditz \
  --jinja.args.bootstrapServers $KAFKA_BOOTSTRAP_SERVERS \
  --jinja.args.sinkTopic $TOPIC_RAW_CDCEVENT_ROUTE \
  --sql.filepath $FLINK_JOB_DIR/$SQL_FILE