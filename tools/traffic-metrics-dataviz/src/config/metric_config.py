from dataclasses import dataclass
from typing import Optional

@dataclass
class MetricConfig:
    label: str
    metric_name: str
    aggregation: str
    alias: str
    x_axis_title: str
    chart_title: str


METRICS: list[MetricConfig] = [
    MetricConfig(
        label="Max Speed",
        metric_name="max.vehicles.speed",
        aggregation="MAX",
        alias="max_speed",
        x_axis_title="Max Speed Recorded (km/h)",
        chart_title="Top 3 Speed Podium",
    ),
    MetricConfig(
        label="Active Vehicles",
        metric_name="count.vehicle.active",
        aggregation="SUM",
        alias="count_active_vehicles",
        x_axis_title="Active Vehicles (moved in last 10 min)",
        chart_title="Top 3 Most Active Lines",
    ),
    MetricConfig(
        label="Avg Speed",
        metric_name="average.vehicle.speed",
        aggregation="SUM",
        alias="avg_speed",
        x_axis_title="Average Speed (km/h)",
        chart_title="Top 3 Average Speed"
    ),
]