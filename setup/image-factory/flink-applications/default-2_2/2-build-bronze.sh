source config.sh
source functions/build-image.sh

build_maven_docker_image \
    "$ROOT_REPO_DIR/etl/02-bronze/cdcevent-route" \
    "bronze-cdcevent-route-0.1.0.jar" \
    "asphalt/bronze-cdcevent-route:0.1.0"

build_maven_docker_image \
    "$ROOT_REPO_DIR/etl/02-bronze/vehicle-position" \
    "bronze-vehicle-position-0.1.0.jar" \
    "asphalt/bronze-vehicle-position:0.1.0"
