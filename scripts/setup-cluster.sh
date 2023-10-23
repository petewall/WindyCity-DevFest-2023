#!/bin/bash

set -e
kubectl apply -f deployments/monitoring-namespace.yaml

helm upgrade --install --wait -n monitoring prometheus prometheus-community/prometheus -f configs/prometheus.yaml
helm upgrade --install --wait -n monitoring loki grafana/loki -f configs/loki.yaml
helm upgrade --install --wait -n monitoring tempo grafana/tempo

helm upgrade --install --wait -n monitoring kubernetes-monitoring grafana/k8s-monitoring -f configs/kubernetes-monitoring.yaml

helm upgrade --install --wait -n monitoring grafana grafana/grafana -f configs/grafana.yaml

kubectl apply -f deployments/kspan.yaml
kubectl apply -f deployments/application.yaml
kubectl apply -f deployments/crashing-app.yaml
