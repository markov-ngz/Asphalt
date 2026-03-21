kubectl config set-context --current --namespace=monitoring

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack --verify --namespace monitoring > setup_result.sh

# Check 
# Add dashboard https://grafana.com/grafana/dashboards/14911-flink/