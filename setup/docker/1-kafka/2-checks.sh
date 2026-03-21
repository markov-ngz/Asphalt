# Debugging commands 

# Generic configs
export KAFKA_DIR=/opt/kafka
export BOOTSTRAP_SERVER=kafka:29092
export GROUP_NAME=debug


# Read from topic 
docker exec -it kafka $KAFKA_DIR/bin/kafka-console-consumer.sh  \
    --bootstrap-server $BOOTSTRAP_SERVER \
    --topic $TOPIC_SILVER_INVALID_VEHICLE_POSITION \
    --consumer-property group.id=$GROUP_NAME