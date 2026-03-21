import os 

db_username = os.environ.get('DB_USERNAME')
db_password = os.environ.get('DB_PASSWORD')
db_host = os.environ.get('DB_HOST')
db_port = os.environ.get('DB_PORT')
db_name = os.environ.get('DB_NAME')


# Create a connection configuration dictionary
CONNECTION_CONFIG = {
    "name": "postgresql",
    "dialect":"postgresql",
    "type": "sql",
    "host": db_host,
    "port": db_port,
    "database": db_name,
    "username": db_username,
    "password": db_password
}
