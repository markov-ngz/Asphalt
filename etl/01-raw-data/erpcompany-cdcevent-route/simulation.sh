# Execute a SQL file in order to trigger the WAL and the consumption by the connector 
export GTFS_DB_CONTAINER=erpcompany_db
export SQL_FILE=simulation-query.sql

docker cp $SQL_FILE $GTFS_DB_CONTAINER:/simulation-query.sql
docker exec -it $GTFS_DB_CONTAINER psql -U kakarott -d GTFS -a -f /simulation-query.sql