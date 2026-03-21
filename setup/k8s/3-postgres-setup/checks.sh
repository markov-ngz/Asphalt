export ERP_DB_POD=$(kubectl get pod -l app=erp-db -o name)

# kubectl exec $ERP_DB_POD -- psql \
#     -U kakarott \
#     -d GTFS \
#     -c "TRUNCATE TABLE routes"

kubectl exec $ERP_DB_POD -- psql \
    -U kakarott \
    -d GTFS \
    -c "SELECT _source_city, _source_transport, _updated_at, count(*) FROM routes GROUP BY 1,2,3"