source config.sh
source functions/build-image.sh

SQL_FILE_PATH=$ROOT_REPO_DIR/etl/05-export/traffic-metrics
SQL_FILE=traffic-metrics-to-analytics.sql

build_sql_image \
    $SQL_RUNNER_FOLDER \
    $SQL_RUNNER_JAR \
    $SQL_FILE_PATH \
    $SQL_FILE \
    "asphalt/export-traffic-metrics:0.1.0"