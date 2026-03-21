# Export 
kubectl apply -k overlays/5-export/traffic-metrics

# Gold
kubectl apply -k overlays/4-gold/traffic-metrics

# Silver 
kubectl apply -k overlays/3-silver/active-vehicle-position

kubectl apply -k overlays/3-silver/enriched-vehicle-position

# Bronze 
kubectl apply -k overlays/2-bronze/cdcevent-route/
kubectl apply -k overlays/2-bronze/vehicle-position/

# Raw 
sleep 180
kubectl apply -k overlays/1-raw/cdcevent-route/
kubectl apply -k overlays/1-raw/gtfs-vehicleposition-rennes/
kubectl apply -k overlays/1-raw/gtfs-vehicleposition-bordeaux/

kubectl get flinkdeployment

kubectl get pods