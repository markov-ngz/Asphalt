WITH last_window AS (
    SELECT MAX(window_end) AS latest_window_end
    FROM analytics.traffic_metric_route_event
    WHERE metric_name = '{{ metric_name }}'
),
last_events AS (
    SELECT
        city,
        transport,
        route_short_name,
        route_long_name,
        metric_value,
        window_start,
        window_end,
        event_count
    FROM analytics.traffic_metric_route_event
    WHERE
        metric_name = '{{ metric_name }}'
        AND window_end >= (SELECT latest_window_end FROM last_window)
)
SELECT
    city,
    transport,
    route_short_name,
    route_long_name,
    window_start,
    window_end,
    {{ aggregation }}(metric_value) AS {{ alias }}
FROM last_events
GROUP BY 1, 2, 3, 4, 5, 6
ORDER BY {{ alias }} DESC;