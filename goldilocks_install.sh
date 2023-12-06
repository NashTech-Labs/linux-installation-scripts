#!/usr/bin/bash

sudo apt update

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server
helm upgrade --install metrics-server metrics-server/metrics-server
echo "Installed metrics-server in your k8s cluster."

kubectl label namespaces --all goldilocks.fairwinds.com/enabled=true
echo "All namespaces labeled."

helm repo add fairwinds-stable https://charts.fairwinds.com/stable
helm upgrade --install goldilocks fairwinds-stable/goldilocks --namespace goldilocks --create-namespace --set vpa.enabled=true
echo "Installed goldilocks chart in your k8s cluster."

kubectl patch svc goldilocks-dashboard -n goldilocks -p '{"spec": {"type": "LoadBalancer"}}'

