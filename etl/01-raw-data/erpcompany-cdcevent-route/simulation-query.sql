
-- Simulate GTFS routes data changes to check wal consumption
DELETE FROM routes WHERE route_id = '6-1001' AND _source_city = 'rennes' AND _source_transport = 'star'; 

INSERT INTO routes(
    route_id,
    agency_id,
    route_short_name,
    route_long_name,
    route_desc,
    route_type,
    route_url,
    route_color,
    route_text_color,
    route_sort_order,
    _source_city,
    _source_transport
) VALUES (
    '6-1001',
    '1',
    'a',
    'Rennes (J.F. Kennedy) <> Rennes (La Poterie)',
    'Métro',
    1,
    NULL,
    'EE1D23',
    'FFFFFF',
    1,
    'rennes',
    'star'
);

-- Update values 

UPDATE routes SET 
    route_short_name = '68',
    route_long_name = 'Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)',
    route_desc = 'Métropolitaine',
    route_type = 3,
    route_color = '004F9E',
    route_text_color = 'FFFFFA', -- changed this to trigger debezium update
    route_sort_order = 1068
WHERE route_id = '6-0068' AND _source_city = 'rennes' AND _source_transport = 'star';

UPDATE routes SET 
    route_short_name = '68',
    route_long_name = 'Gévezé (Cheval Blanc) <> Rennes (Villejean-Université)',
    route_desc = 'Métropolitaine',
    route_type = 3,
    route_color = '004F9E',
    route_text_color = 'FFFFFF',
    route_sort_order = 1068
WHERE route_id = '6-0068' AND _source_city = 'rennes' AND _source_transport = 'star';
