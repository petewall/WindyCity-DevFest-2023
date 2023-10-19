#!/bin/bash

set -eo pipefail

helm upgrade --install --wait prometheus prometheus-community/prometheus -f prometheus.yaml -n prometheus --create-namespace
helm upgrade --install --wait loki grafana/loki -f loki.yaml -n loki --create-namespace
helm upgrade --install --wait grafana grafana/grafana -f grafana.yaml -n grafana --create-namespace
helm upgrade --install --wait kubernetes-monitoring grafana/k8s-monitoring -f values.yaml -n monitoring --create-namespace
