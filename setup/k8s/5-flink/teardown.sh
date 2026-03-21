# Export 
kubectl delete -k overlays/5-export/traffic-metrics

# Gold
kubectl delete -k overlays/4-gold/traffic-metrics

# Silver 
kubectl delete -k overlays/3-silver/active-vehicle-position

kubectl delete -k overlays/3-silver/enriched-vehicle-position

# Bronze 
kubectl delete -k overlays/2-bronze/cdcevent-route/
kubectl delete -k overlays/2-bronze/vehicle-position/

# Raw 
kubectl delete -k overlays/1-raw/cdcevent-route/
kubectl delete -k overlays/1-raw/gtfs-vehicleposition-rennes/
kubectl delete -k overlays/1-raw/gtfs-vehicleposition-bordeaux/