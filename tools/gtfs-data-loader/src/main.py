import os
from io import StringIO
import sys
import logging

import pandas as pd

from database import insert_csv_data
from config import TABLE_NAME , GTFS_URL, GTFS_FILENAME, GTFS_CITY, GTFS_TRANSPORT , GTFS_ROUTES_COLUMNS
from download_static_data import (
    download_data,
    unzip_file_bytes,
    convert_filebytes_to_dataframe,
)
from prepare_gtfs_data import prepare_routes_data

LOG = logging.getLogger(__name__)

logging.basicConfig(
    handlers=[
        logging.StreamHandler(sys.stdout),
    ],
    level=logging.DEBUG,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
# NOTE : Logging config from : 
# Source - https://stackoverflow.com/a/74237674
# Posted by Vlad Bezden
# Retrieved 2026-03-01, License - CC BY-SA 4.0


def main():

    # 1. Download the zip file as buffer
    data = download_data(GTFS_URL)

    LOG.info("Successfully downloaded data")

    # 2. Extract file bytes from zip bytes
    file_bytes = unzip_file_bytes(data, GTFS_FILENAME)

    LOG.info("Succesfully unzipped file")

    # 3. Convert bytes to pd.Dataframe
    df: pd.DataFrame = convert_filebytes_to_dataframe(file_bytes)

    LOG.info("Succesfully converted bytes to dataframe with shape %s", df.shape)

    # 4. Add specific fields
    df_prepared = prepare_routes_data(df, GTFS_ROUTES_COLUMNS, GTFS_CITY, GTFS_TRANSPORT)

    LOG.info("Successfully prepared GTFS data")

    # 5. Insert the dataframe data
    df_csv = df_prepared.to_csv(index=False)  # convert format
    data: StringIO = StringIO(df_csv)  #get buffer
    insert_csv_data(data, TABLE_NAME, df_prepared.columns.to_list())

    LOG.info("Succesfully copied data to target table, exiting ...")
if __name__ == "__main__":
    main()
