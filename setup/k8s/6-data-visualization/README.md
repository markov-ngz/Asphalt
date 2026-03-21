NOTES on traefik gateway setup : 
Add traefik gateway :

https://doc.traefik.io/traefik/reference/install-configuration/providers/kubernetes/kubernetes-gateway/

or with helm 

https://doc.traefik.io/traefik/getting-started/install-traefik/#use-the-helm-chart

Steps followed : 
```sh
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik --namespace traefik
# Check if gateway class is installed by default : 
kubectl get gatewayclass traefik
# Should see => Error from server (NotFound): gatewayclasses.gateway.networking.k8s.io "traefik" not found
# Upgrade the chart to enable it 
helm upgrade traefik traefik/traefik --reuse-values --set providers.kubernetesGateway.enabled=true -n traefik
# Expose service locally 
minikube tunnel
```
Help to understand : 
https://doc.traefik.io/traefik/reference/routing-configuration/kubernetes/gateway-api/#deploying-a-gateway
