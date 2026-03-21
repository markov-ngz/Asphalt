CREATE TABLE kafka_traffic_source (
    name STRING,
    dimension ROW<
        city STRING, 
        transport STRING, 
        routeId STRING, 
        routeName STRING, 
        routeLongName STRING, 
        routeDesc STRING
    >,
    `window` ROW<
        `start` BIGINT,
        `end` BIGINT
    >,
    metric ROW<
        `value` FLOAT
    >,
    eventCount INT
) WITH (
    'connector' = 'kafka',
    'topic-pattern' = '{{ sourceTopicPattern }}',
    'properties.bootstrap.servers' = '{{ bootstrapServers}}',
    'properties.group.id' = 'testGroup',
    'format' = 'json',
    'scan.startup.mode' = 'earliest-offset'
);

CREATE TABLE pg_traffic_metric (
    metric_name STRING,
    city STRING,
    transport STRING,
    route_id STRING,
    route_short_name STRING,
    route_long_name STRING,
    route_desc STRING,
    window_start BIGINT,
    window_end BIGINT,
    metric_value FLOAT,
    event_count INT
) WITH (
   'connector' = 'jdbc',
   'url' = 'jdbc:postgresql://{{ hostname }}:{{ port }}/GTFS',
   'table-name' = 'analytics.traffic_metric_route_event',
   'username' = '{{ username }}',
   'password' = '{{ password }}'
);

INSERT INTO pg_traffic_metric
SELECT 
    name,
    dimension.city,
    dimension.transport,
    dimension.routeId,
    dimension.routeName,
    dimension.routeLongName,
    dimension.routeDesc,
    `window`.`start`,
    `window`.`end`,
    metric.`value`,
    eventCount
FROM kafka_traffic_source;