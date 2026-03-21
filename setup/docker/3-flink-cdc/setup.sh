# 1. Download artefacts 
# Because of dependencies vulnerabilities , it is to your charge to download the jar for this version  :

mkdir lib 
echo Download the libs : \
    flink-connector-jdbc-3.3.0-1.20.jar \
    flink-hadoop-fs-1.20.3.jar \
    flink-json-1.20.3.jar \
    flink-sql-connector-kafka-3.4.0-1.20.jar \
    flink-sql-connector-postgres-cdc-3.5.0.jar \
    postgresql-42.7.10.jar > lib

echo flink-cdc-3.5.0-bin.tar.gz > .


# 2. Build the sql runner jar 
app_path=../../../tools/flink-sql-runner
mvn clean package -f "$app_path/pom.xml" -DskipTests
cp $app_path/target/flink-sql-runner-0.1.0.jar ./usrlib/

docker compose up -d 