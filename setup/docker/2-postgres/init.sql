-- base table to enrich gtfs vehicle position event 
CREATE TABLE routes (
    id SERIAL PRIMARY KEY,
    route_id VARCHAR NOT NULL,
    agency_id VARCHAR,
    route_short_name VARCHAR,
    route_long_name VARCHAR,
    route_desc TEXT,
    route_type INTEGER,
    route_url VARCHAR,
    route_color VARCHAR(6),
    route_text_color VARCHAR(6),
    route_sort_order INTEGER,
    _source_city VARCHAR NOT NULL,
    _source_transport VARCHAR NOT NULL,
    _updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.routes REPLICA IDENTITY FULL ;

CREATE PUBLICATION gtfs_publication FOR TABLE routes ;

-- Analytics database to see the results 

CREATE SCHEMA analytics;

-- 3 tables for analytics 
CREATE TABLE analytics.traffic_metric_route_event(
    
    id SERIAL PRIMARY KEY,
    
    -- name
    metric_name VARCHAR(255),

    -- dimensions columns 
    city VARCHAR(255),
    transport VARCHAR(255),
    route_id VARCHAR,
    route_short_name VARCHAR,
    route_long_name VARCHAR,
    route_desc TEXT,

    -- temporal dimension 
    window_start BIGINT,
    window_end BIGINT,
    -- metrics 
    metric_value FLOAT,
    -- metadata  
    event_count INTEGER,

    -- technical fields 
    _updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

);