# 🛞 Kubernetes 
Steps to deploy on kubernetes using minikube cluster.

This deployment is a bit heavy as it deploys flink on application mode.

If you do not have an active cluster running and you wish to run this on a local single node cluster please respect the configuration below.

## 1. Prerequisistes for local setup 
- minikube : <a>https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download</a>
- docker engine  : <a>https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository</a>
- kubectl : <a>https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/</a>
- Create a minikube cluster with appropriate resources : <a>https://minikube.sigs.k8s.io/docs/commands/start/</a>
Recommended Cluster configuration for single node : 
- RAM : 14 Gb

## 2. Build Docker image 
### 2.1 Flink 2.2 applications 
1. Download the required jars ( i do not do it automatically as it is your responsability to check the sha ) : 
```sh
flink-metrics-prometheus-2.2.0.jar
flink-s3-fs-hadoop-2.2.0.jar
```

2. Build flink 2.2 applications ( it will package with maven and build the image )
```sh
# setup/image-factory/flink-applicqtions/default-2_2
source 1-build-raw.sh
source 1-build-bronze.sh
source 1-build-silver.sh
source 1-build-gold.sh
```
### 2.2 Build flink 1.20.3 applications ( for sql jobs )
1. Download the jars and plugins : 
```sh
flink-connector-jdbc-3.3.0-1.20.jar
flink-json-1.20.3.jar
flink-sql-connector-kafka-3.4.0-1.20.jar
flink-sql-connector-postgres-cdc-3.5.0.jar
postgresql-42.7.10.jar
flink-cdc-3.5.0-bin.tar.gz 
```

2. Build the images  
```sh
# setup/image-factory/flink-applications/sql-1_20
source 1-build-raw.sh
source 5-build-export.sh
```
3. Build data loader image 
```sh
# tools/gtfs-data-loader 
source build.sh
```
4. Buld data visualization image 
```sh
# tools/traffic-metrics-dataviz
source build.sh
```
NOTE : 
For minikube users : 
- the script `load-image-to-minikube.sh` allows to automatically load the images to the cluster.
- or load single one with `load-single-image.sh`
## 3. Install core helm charts
1. Create namespace 
```sh
# setup/k8s/
kubectl apply -f namespaces.yaml
```
2. Install helm charts to use the crds
```sh
# setup/k8s/0-helm-charts

source flink-operator.sh
source prom-graph.sh
source traefik.sh
``` 

## 4. Create the resources 

1. Kafka cluster 
```sh 
# setup/k8s/1-kafka

kubectl apply -f .
# wait for deployment to finish to create topics 
source setup.sh 
```
2. Postgres database 
```sh
# setup/k8s/2-postgres

kubectl apply -f .

# optional : check table creations
source checks.sh
```
3. Load Gtfs Route data to postgres database
```sh
# setup/k8s/3-postgres-setup
kubectl apply -f .
```
4. Create flink state backend remote storage
```sh
# setup/k8s/4-flink-state-backend
kubectl apply -f . 
```
5. Deploy flink applications 
```sh
# setup/k8s/5-flink
source setup.sh
```
6. Deploy the visualization tool 
```sh
# setup/k8s/6-data-visualization
kubectl apply -f . 
```
7. Add the monitoring 
```sh
# setup/k8s/monitoring
kubectl apply -f .
```