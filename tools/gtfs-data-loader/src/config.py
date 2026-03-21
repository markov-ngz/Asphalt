import os 

# Postgres Settings 

PG_HOST = os.environ["PG_HOST"]
PG_PORT = os.environ["PG_PORT"]
PG_DB = os.environ["PG_DB"]
PG_USER = os.environ["PG_USER"]
PG_PASSWORD = os.environ["PG_PASSWORD"]

DATABASE_URL = f"postgres://{PG_USER}:{PG_PASSWORD}@{PG_HOST}:{PG_PORT}/{PG_DB}"

TABLE_NAME = os.getenv("TABLE_NAME", "routes")

# Static data settings

GTFS_URL = os.environ["GTFS_URL"]
GTFS_FILENAME = os.getenv("GTFS_FILENAME", "routes.txt")
GTFS_CITY =  os.environ["GTFS_CITY"]
GTFS_TRANSPORT = os.environ["GTFS_TRANSPORT"]


GTFS_ROUTES_COLUMNS = [
    "route_id",
    "agency_id",
    "route_short_name",
    "route_long_name",
    "route_desc",
    "route_type",
    "route_url",
    "route_color",
    "route_text_color",
    "route_sort_order"
]



