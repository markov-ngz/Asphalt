# Flink operator 

# ( see : https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-main/docs/try-flink-kubernetes-operator/quick-start/ )
kubectl create ns flink
# Add flink to helm repos 
helm repo add flink-operator-repo https://downloads.apache.org/flink/flink-kubernetes-operator-1.13.0/
# Install the chart 
helm install flink-kubernetes-operator flink-operator-repo/flink-kubernetes-operator --namespace flink 