# Prometheus + Grafan stack 

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack --verify --namespace monitoring 