# WindyCity DevFest 2023

Thank you for your interest in my talk at [WindyCity DevFest 2023](https://windycity.devfest.io/)!

This repo has the source for the demo that I gave.

## Slides

The link to the slides will be uploaded in the future!

## Setting up the environment

### Set up cluser
make create-cluster
rm kubeconfig.yaml; make kubeconfig.yaml

### Deploy applications
kubectl apply -f deployments

### Deploy telemetry data storage
helm install prometheus prometheus-community/prometheus -f configs/prometheus.yaml -n monitoring
helm install loki grafana/loki -f configs/loki.yaml -n monitoring
helm install tempo grafana/tempo -n monitoring

### Deploy Kubernetes Monitoring
helm install kubernetes-monitoring grafana/k8s-monitoring --version 0.2.12 -f configs/kubernetes-monitoring.yaml -n monitoring --wait

### Deploy Grafana
helm install grafana grafana/grafana -f configs/grafana.yaml -n monitoring --wait

### Take a look!
Launch k9s and port forward grafana
./scripts/grafana-creds.sh | pbcopy
Open [Grafana](http://localhost:3000)
