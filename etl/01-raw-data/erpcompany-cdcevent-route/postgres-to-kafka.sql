CREATE TABLE routes_cdc (

  database_name STRING  METADATA FROM 'database_name' VIRTUAL,
  schema_name STRING  METADATA FROM 'schema_name' VIRTUAL,
  table_name STRING  METADATA FROM 'table_name' VIRTUAL,
  op_ts TIMESTAMP_LTZ(3)  METADATA FROM 'op_ts' VIRTUAL,
  row_kind STRING  METADATA FROM 'row_kind' VIRTUAL,

  id INT,
  route_id STRING,
  agency_id STRING,
  route_short_name STRING,
  route_long_name STRING,
  route_desc STRING,
  route_type INT,
  route_url STRING,
  route_color STRING,
  route_text_color STRING,
  route_sort_order INT,
  _source_city STRING,
  _source_transport STRING,
  _updated_at TIMESTAMP(3),
  PRIMARY KEY (id) NOT ENFORCED
) WITH (
  'connector' = 'postgres-cdc',
  'hostname' = '{{ hostname }}',
  'port' = '{{ port }}',
  'username' = '{{ username }}',
  'password' = '{{ password }}',
  'database-name' = 'GTFS',
  'schema-name' = 'public',
  'table-name' = 'routes',
  'slot.name' = 'gtfs_slot',
  'changelog-mode' = 'upsert',
  'decoding.plugin.name' = 'pgoutput',
  'debezium.publication.name' ='gtfs_publication'
);

CREATE TABLE routes_kafka (
  -- -- Kafka SQL connector fields 
  _kafka_origin_ts TIMESTAMP(3) METADATA FROM 'timestamp',
  -- default delimiter is comma and is form like k:v
  _kafka_origin_headers  MAP<STRING, STRING> METADATA  FROM 'headers',


  -- Postgres Connector Cdc available fields 
  database_name STRING,
  schema_name STRING, 
  table_name STRING,
  op_ts TIMESTAMP_LTZ(3),
  row_kind STRING,

  -- Actual Value payload as JSON
  value_payload STRING
  
) WITH (
  'connector' = 'kafka',
  'topic' = '{{ sinkTopic }}',
  'properties.bootstrap.servers' = '{{ bootstrapServers }}',
  'format' = 'debezium-json',
  'properties.group.id' = 'testGroup'
);

INSERT INTO routes_kafka
SELECT
  -- log timestamp 
  CAST(CURRENT_TIMESTAMP AS TIMESTAMP(3)),
  -- Headers 
  MAP[
    'database_name', CAST(database_name AS STRING), 
    'schema_name', CAST(schema_name AS STRING),
    'table_name', CAST(table_name AS STRING),
    'op_ts', CAST(op_ts AS STRING),
    'row_kind', CAST(row_kind AS STRING)
  ],

  -- Value 

  database_name,
  schema_name,
  table_name,
  op_ts, 
  row_kind,

  JSON_OBJECT(
  'id' VALUE id,
  'routeId' VALUE route_id,
  'agencyId' VALUE agency_id,
  'routeShortName' VALUE route_short_name,
  'routeLongName' VALUE route_long_name,
  'routeDesc' VALUE route_desc,
  'routeType' VALUE route_type,
  'routeUrl' VALUE route_url,
  'routeColor' VALUE route_color,
  'routeTextColor' VALUE route_text_color,
  'routeSortOrder' VALUE route_sort_order,
  'sourceCity' VALUE _source_city,
  'sourceTransport' VALUE _source_transport,
  'updatedAt' VALUE _updated_at
  )

FROM routes_cdc
;