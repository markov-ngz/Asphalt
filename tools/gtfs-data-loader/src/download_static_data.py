import requests
import zipfile
import io
import logging
import pandas as pd


logger = logging.getLogger(__name__)


def download_data(url: str) -> bytes:

    response = requests.get(url)

    if response.status_code != 200:
        raise Exception(
            f"Invalid status code received, expected 200, got : {response.status_code}"
        )

    data = response.content

    return data


def unzip_file_bytes(buffer: bytes, filename: str) -> bytes:

    # 1. Buffer -> ZipFile
    z = zipfile.ZipFile(io.BytesIO(buffer))

    logger.info(
        "Files existing in the zip  : {0}".format(
            [zinfo.filename for zinfo in z.infolist()]
        )
    )

    # 3. Extract the bytes of the filename
    return z.read(filename)


def convert_filebytes_to_dataframe(buffer: bytes) -> pd.DataFrame:

    # 1. Decode as utf8 string
    str_buffer: str = buffer.decode("utf-8")

    # 2. Convert as dataframe
    df = pd.read_csv(io.StringIO(str_buffer))

    return df
