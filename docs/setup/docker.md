# 🐳 Docker 
Deployment with docker , only 2 flink clusters ( using session mode ) are running with different versions:

- flink 2.2 : for basic apps with datastream api 
- flink 1.20.3 :  for sql jobs as flink cdc / sql was incompatible with 2.2 ) 
## 0. Prerequisites 
- docker installed : <a>https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository</a>
- create common network : `docker network create asphalt`
## 1. Kafka 
```sh
# setup/docker/1-kafka 
docker compose up -d 
```
## 2. Postgres
```sh
# setup/docker/2-postgres
docker compose up -d 
```
## 3. Flink CDC / SQL cluster 
1. Download the jars & plugin with maven : 
```sh
flink-connector-jdbc-3.3.0-1.20.jar
flink-hadoop-fs-1.20.3.jar
flink-json-1.20.3.jar
flink-sql-connector-kafka-3.4.0-1.20.jar
flink-sql-connector-postgres-cdc-3.5.0.jar
postgresql-42.7.10.jar
```
2. Run the cluster 
```sh
# setup/docker/3-flink-cdc
docker compose up 
```
## 4. Flink cluster + jobs 
1. Download the jar 
```sh
flink-metrics-prometheus-2.2.0.jar
flink-s3-fs-hadoop-2.2.0.jar
```
2. Run the cluster
```sh
# setup/docker/4-flink
docker compose up -d 
```
3. Submit the jobs 
```sh
# setup/docker/4-flink
source 0-config.sh
source 1-export-jobs.sh
source 2-gold-jobs.sh
source 3-silver-jobs.sh
source 4-bronze-jobs.sh
source 5-raw-cdc-jobs.sh
source 6-raw-vehiclepos-jobs.sh
```
## 5. Data visualization
```sh
# setup/docker/5-data-visualization
docker compose up -d 
```
## 6. Monitor 
```sh
# setup/docker/6-monitoring
docker compose up -d 
```