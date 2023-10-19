#!/bin/bash

set -e
helm upgrade --install --wait prometheus prometheus-community/prometheus -f configs/prometheus.yaml -n prometheus --create-namespace
helm upgrade --install --wait loki grafana/loki -f configs/loki.yaml -n loki --create-namespace
helm upgrade --install --wait grafana grafana/grafana -f configs/grafana.yaml -n grafana --create-namespace
helm upgrade --install --wait kubernetes-monitoring grafana/k8s-monitoring -f configs/kubernetes-monitoring.yaml -n monitoring --create-namespace
