export ERP_DB_POD=$(kubectl get pod -l app=erp-db -o name)

kubectl exec $ERP_DB_POD -- psql -U kakarott -d GTFS -c "SELECT count(*) FROM routes LIMIT 10"


kubectl exec $ERP_DB_POD -- psql -U kakarott -d GTFS -c "SELECT count(*) FROM analytics.traffic_metric_route_event LIMIT 10"
