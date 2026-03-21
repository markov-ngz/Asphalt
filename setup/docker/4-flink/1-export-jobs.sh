SQL_FILE_DIR=$ROOT_REPO_DIR/etl/05-export/traffic-metrics
SQL_FILE=traffic-metrics-to-analytics.sql

docker cp $SQL_FILE_DIR/$SQL_FILE $FLINK_CDC_JOBMANAGER_CONTAINERNAME:$FLINK_JOB_DIR

docker exec -it $FLINK_CDC_JOBMANAGER_CONTAINERNAME flink run -d \
  $SQL_RUNNER_JAR \
  --jinja.args.hostname erpcompany_db \
  --jinja.args.port 5432 \
  --jinja.args.username kakarott \
  --jinja.args.secrets.password raditz \
  --jinja.args.bootstrapServers $KAFKA_BOOTSTRAP_SERVERS \
  --jinja.args.sourceTopicPattern $EXPORT_SOURCE_TOPIC_PATTERN \
  --sql.filepath $FLINK_JOB_DIR/$SQL_FILE