from pathlib import Path
from jinja2 import Environment, FileSystemLoader
from config import MetricConfig

_env = Environment(loader=FileSystemLoader(Path(__file__).parent / "queries"))


def build_query(metric: MetricConfig) -> str:
    template = _env.get_template("traffic_metric.sql")
    return template.render(
        metric_name=metric.metric_name,
        aggregation=metric.aggregation,
        alias=metric.alias,
    )