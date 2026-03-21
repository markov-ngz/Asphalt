# To save output from extraction
kubectl exec $ERP_DB_POD -- pg_dump -d GTFS -U kakarott > filename.sql