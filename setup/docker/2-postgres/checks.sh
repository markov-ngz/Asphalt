docker exec -it erpcompany_db psql -d GTFS -U kakarott -c "SELECT _source_transport,  COUNT(*) FROM routes GROUP BY 1"

# In case of failure or wrong manipulation : 
# docker exec -it erpcompany_db psql -d GTFS -U kakarott -c "TRUNCATE TABLE routes"