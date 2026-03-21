IMAGE_TO_LOAD=asphalt/export-traffic-metrics:0.1.0

# Delete former image 
minikube image rm $IMAGE_TO_LOAD
# Update new image 
minikube image load $IMAGE_TO_LOAD
# Check image present 
minikube image ls | grep "$IMAGE_TO_LOAD"