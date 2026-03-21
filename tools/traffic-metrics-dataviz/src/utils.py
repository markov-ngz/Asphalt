import pandas as pd
from datetime import timezone

def format_window_end(ts_ms: int) -> str:
    dt = pd.to_datetime(ts_ms, unit="ms", utc=True).astimezone(tz='Europe/Paris')
    return dt.strftime("%d %b %Y, %H:%M:%S")

def format_window_size(start_ms: int, end_ms: int) -> str:
    delta = pd.Timedelta(milliseconds=end_ms - start_ms)
    total_seconds = int(delta.total_seconds())
    minutes, seconds = divmod(total_seconds, 60)
    hours, minutes = divmod(minutes, 60)
    if hours:
        return f"{hours}h {minutes}m"
    if minutes:
        return f"{minutes}m {seconds}s"
    return f"{seconds}s"