# Build Docker images for romantic-saga project
docker build -t suitor-service:latest ./suitor-service
docker build -t girl-service:latest ./girl-service
docker build -t mom-service:latest ./mom-service
docker build -t dad-service:latest ./dad-service
docker build -t bigbro-service:latest ./bigbro-service
docker build -t love-coordinator:latest ./love-coordinator
docker build -t love-dashboard:latest ./love-dashboard

# Deploy to Kubernetes
kubectl apply -f k8s.yaml

# Check deployment status
kubectl get pods 
kubectl get svc

# Expose service for testing
kubectl port-forward svc/love-dashboard 5000:5000
kubectl port-forward svc/rabbitmq 15672:15672

# Execute pod in bash mode
kubectl exec -it <pod-name> -- bash

# Execute the proposals
python ... .py

# Delete deployment
kubectl delete -f .\k8s.yaml
kubectl get all

# Remove built images
docker rmi suitor-service:latest
docker rmi girl-service:latest
docker rmi mom-service:latest
docker rmi dad-service:latest
docker rmi bigbro-service:latest
docker rmi love-coordinator:latest
docker rmi love-dashboard:latest