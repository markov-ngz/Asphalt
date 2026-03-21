kubectl exec $KAFKA_POD -- $KAFKA_DIR/bin/kafka-console-consumer.sh --from-beginning \
    --bootstrap-server $BOOTSTRAP_SERVER \
    --topic $TOPIC_RAW_GTFSRT_VEHICLEPOSITION