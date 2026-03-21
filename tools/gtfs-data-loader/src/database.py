import psycopg
from psycopg import sql
import io
from config import DATABASE_URL

def connect()->None:
    try:
        return psycopg.connect(DATABASE_URL)
    except Exception as e:
        raise Exception(f"Could not connect to the database: {e}")

    

def insert_csv_data(
    csv_data: io.StringIO, table_name: str, columns: list[str]
)->None:
    """Copy CSV bytes into the target table respecting the given columns order"""

    try:
        with connect() as conn:
            cur = conn.cursor()

            # Reset the StringIO position to the start
            csv_data.seek(0)

            # Use the copy method as a context manager
            with cur.copy(
                sql.SQL(
                    "COPY {table} ({fields}) FROM STDIN WITH (FORMAT CSV, HEADER TRUE)"
                ).format(
                    table=sql.Identifier(table_name),
                    fields=sql.SQL(", ").join(map(sql.Identifier, columns)),
                )
            ) as copy:
                # Write the CSV data to the COPY command
                copy.write(csv_data.read())

            conn.commit()
            cur.close()
            conn.close()

    except Exception as e:
        raise Exception(f"Error inserting CSV data: {e}")
