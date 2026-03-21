source config.sh
source functions/build-image.sh

SQL_FILE_PATH=$ROOT_REPO_DIR/etl/01-raw-data/erpcompany-cdcevent-route
SQL_FILE=postgres-to-kafka.sql

build_sql_image \
    $SQL_RUNNER_FOLDER \
    $SQL_RUNNER_JAR \
    $SQL_FILE_PATH \
    $SQL_FILE \
    "asphalt/raw-cdcevent-route:0.1.0"