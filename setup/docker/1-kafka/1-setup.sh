#!/bin/bash

export KAFKA_DIR=/opt/kafka
export BOOTSTRAP_SERVER=kafka:29092

# 1. List of topics to create
source ./topics_name.sh

# 2. Loop over each item to create the topic
for TOPIC_NAME in "${TOPICS[@]}"; do
    docker exec -it kafka $KAFKA_DIR/bin/kafka-topics.sh --create \
        --bootstrap-server $BOOTSTRAP_SERVER \
        --topic $TOPIC_NAME \
        --replication-factor 1 \
        --partitions 1
done

# 3. List all topics to see 
docker exec -it kafka $KAFKA_DIR/bin/kafka-topics.sh --list \
    --bootstrap-server $BOOTSTRAP_SERVER