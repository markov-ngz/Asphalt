source config.sh
source functions/build-image.sh

build_maven_docker_image \
    "$ROOT_REPO_DIR/etl/03-silver/active-enriched-vehicle" \
    "silver-active-enriched-vehicle-0.1.0.jar" \
    "asphalt/silver-active-enriched-vehicle:0.1.0"

build_maven_docker_image \
    "$ROOT_REPO_DIR/etl/03-silver/enriched-vehicle-position" \
    "silver-enriched-vehicle-position-0.1.0.jar" \
    "asphalt/silver-enriched-vehicle-position:0.1.0"