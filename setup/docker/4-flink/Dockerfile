FROM flink:2.2.0-java21

# S3 for remote checkpoint/savepoint
COPY flink-s3-fs-hadoop-2.2.0.jar $FLINK_HOME/plugins/s3-fs-hadoop/
# Prometheus exporter metric jar 
COPY flink-metrics-prometheus-2.2.0.jar $FLINK_HOME/lib/