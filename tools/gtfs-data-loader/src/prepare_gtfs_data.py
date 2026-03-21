
import pandas as pd 
import logging 

LOG = logging.getLogger(__name__)

def prepare_routes_data(
        df : pd.DataFrame , 
        raw_expected_columns : list[str],
        gtfs_city : str ,
        gtfs_transport : str )->pd.DataFrame:
    try: 
        # Add missing columns
        for expected_col in raw_expected_columns :
            if expected_col not in df.columns : 
                df[expected_col] = None

        # Remove unecessary ones ( will fail the copy statement to db )
        df = df[raw_expected_columns]

        # Add technical fields 
        df["_source_city"] = gtfs_city
        df["_source_transport"] = gtfs_transport

        return df 
    except Exception as e : 
        LOG.error("Failed to prepare gtfs routes data",exc_info=True)
        raise e 