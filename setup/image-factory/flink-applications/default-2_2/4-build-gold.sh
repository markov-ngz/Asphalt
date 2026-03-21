source config.sh
source functions/build-image.sh

build_maven_docker_image \
    "$ROOT_REPO_DIR/etl/04-gold/traffic-metrics" \
    "gold-traffic-metrics-0.1.0.jar" \
    "asphalt/gold-traffic-metrics:0.1.0"