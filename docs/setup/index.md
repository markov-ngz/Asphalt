# Setup

2 Local deployments steps are described here and each matches a different way to deploy flink applications :

- 🛞 kubernetes : flink is deployed on application mode ( 1 cluster per app )
- 🐳 docker : flink is deployed on session mode ( multiple apps per cluster )

For production, it is encouraged to use application mode however for local tests, session mode seems the way to go ! 


## Links : 
- Flink deployment modes : https://nightlies.apache.org/flink/flink-docs-stable/docs/deployment/overview/#deployment-modes
- Flink Kubernetes operator : https://nightlies.apache.org/flink/flink-kubernetes-operator-docs-main/
