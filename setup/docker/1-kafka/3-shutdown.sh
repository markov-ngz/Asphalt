export KAFKA_DIR=/opt/kafka
export BOOTSTRAP_SERVER=kafka:29092

# 1. Loop over each item to delete the topics
for TOPIC_NAME in "${TOPICS[@]}"; do
    docker exec -it kafka $KAFKA_DIR/bin/kafka-topics.sh --delete \
        --bootstrap-server $BOOTSTRAP_SERVER \
        --topic $TOPIC_NAME 
done

# 2. List all topics to see deletions
docker exec -it kafka $KAFKA_DIR/bin/kafka-topics.sh --list \
    --bootstrap-server $BOOTSTRAP_SERVER