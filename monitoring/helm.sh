#!/bin/bash
set -e
kubecttl apply -f monitoring/namespace.yaml

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/prometheus \
  --namespace monitoring \
  --set server.service.type=NodePort

helm install grafana grafana/grafana \
  --namespace monitoring \
  --set service.type=NodePort \
  --set adminPassword='admin' \
  --set persistence.enabled=true

echo "Prometheus and Grafana have been installed in the 'monitoring' namespace."