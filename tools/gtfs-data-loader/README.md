# Setup ERP Company factice database

## 1. Description
It will : 
1. Download a Zip file of GTFS static data for STAR transport company 
2. Extract the `routes.txt` file from the buffered zip
3. Copy it into the database

## 2. Run the script
1. Build the image
```sh 
docker build -t <tag> .
```
2. Run the container by specifying the env contained in `env.sh`

