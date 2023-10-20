#!/bin/bash

set -e
kubectl create ns monitoring
helm upgrade --install --wait prometheus prometheus-community/prometheus -f configs/prometheus.yaml -n monitoring
helm upgrade --install --wait loki grafana/loki -f configs/loki.yaml -n monitoring
helm upgrade --install --wait grafana grafana/grafana -f configs/grafana.yaml -n monitoring
helm upgrade --install --wait kubernetes-monitoring grafana/k8s-monitoring -f configs/kubernetes-monitoring.yaml -n monitoring
kubectl apply -f application.yaml
./upload-dashboard.sh dashboards/*.json
