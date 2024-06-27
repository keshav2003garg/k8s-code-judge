#!/bin/bash

# Apply all config files
cd ./config
kubectl apply -f judge0-config.yaml

# Start PVC for postgres
cd ../
cd ./storage
kubectl apply -f postgres-pvc.yaml

# Start all the deployments
cd ../
cd ./apps
kubectl apply -f postgres-deployment.yaml
kubectl apply -f redis-deployment.yaml
kubectl apply -f server-deployment.yaml
kubectl apply -f worker-deployment.yaml

# Start HPA
cd ../
cd ./hpa
kubectl apply -f worker-hpa.yaml
