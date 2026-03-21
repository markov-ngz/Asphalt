# PV_FOLDER=/tmp/hostpath-provisioner/asphalt/flink-session-logs
# # inspect pv 
# # list mounted files 
# LOG_FILE=$(docker exec -it minikube ls $PV_FOLDER | grep "flink--kubernetes-application-" | sed -e 's/\r$//')
# # get content 
# docker exec -it minikube cat $PV_FOLDER/$LOG_FILE > .log 

# kubectl apply -k overlays/2-bronze/cdcevent-route