#!/bin/bash

# load config 
source ./kafka_config.sh

# 1. Loop over each item to create the topic
for TOPIC_NAME in "${TOPICS[@]}"; do
    kubectl exec $KAFKA_POD -- $KAFKA_DIR/bin/kafka-topics.sh --create \
        --bootstrap-server $BOOTSTRAP_SERVER \
        --topic $TOPIC_NAME \
        --replication-factor 1 \
        --partitions 1
done

# 2. List all topics to see creations
kubectl exec $KAFKA_POD -- $KAFKA_DIR/bin/kafka-topics.sh --list \
    --bootstrap-server $BOOTSTRAP_SERVER