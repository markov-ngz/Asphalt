# inspect flink deployment
# kubectl describe flinkdeployment erpcompany-cdcevent-route

PV_FOLDER=/tmp/hostpath-provisioner/asphalt/raw-cdcevent-route-pvc
# inspect pv 
# list mounted files 
LOG_FILE=$(docker exec -it minikube ls $PV_FOLDER | grep "flink--kubernetes-application-" | sed -e 's/\r$//')
# get content 
docker exec -it minikube cat $PV_FOLDER/$LOG_FILE > .log 

# Force session job deletion ( it gets stuck)
# JOB_NAME=
# kubectl patch flinksessionjob $JOB_NAME  --type=json -p='[{"op": "remove", "path": "/metadata/finalizers"}]'
# and then delete the deployment : kubectl delete flinkdeployment flink-sql-session