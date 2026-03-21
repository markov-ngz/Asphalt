# docker exec -it $FLINK_CDC_JOBMANAGER_CONTAINERNAME flink run -d \
#   $FLINK_JOB_DIR/$RAW_CDCEVENTROUTE_JAR_FILE \
#   --jinja.args.username erpcompany_db \
#   --jinja.args.toto 5432 \
#   --sql.filepath $FLINK_JOB_DIR/$SQL_FILE

docker logs --tail 500 -t flink-taskmanager > logs 