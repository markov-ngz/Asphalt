source config.sh
source functions/build-image.sh

build_maven_docker_image \
    "$ROOT_REPO_DIR/etl/01-raw-data/gtfsrt-vehicleposition" \
    "raw-gtfsrt-vehicleposition-0.1.0.jar" \
    "asphalt/raw-gtfsrt-vehicleposition:0.1.0"