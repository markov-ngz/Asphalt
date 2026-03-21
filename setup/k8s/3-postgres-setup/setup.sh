
export PATH_TO_GTFS_LOADER=../../../tools/gtfs-data-loader
export IMAGE_TAG=gtfs_data_loader

minikube image rm $IMAGE_TAG

# Build 
docker build -t $IMAGE_TAG $PATH_TO_GTFS_LOADER

minikube image load $IMAGE_TAG

kubectl apply -f . 