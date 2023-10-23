# WindyCity DevFest 2023

This is the source repo for my demo for [WindyCity DevFest 2023](https://windycity.devfest.io/).

## Setting up the environment:

### Set up cluser
* `make create-cluster`
* `make kubeconfig.yaml`

### Deploy applications
* `kubectl apply -f deployments`

### Deploy telemetry data storage
* `helm upgrade --install prometheus prometheus-community/prometheus -f configs/prometheus.yaml -n monitoring --wait`
* `helm upgrade --install loki grafana/loki -f configs/loki.yaml -n monitoring --wait`
* `helm upgrade --install tempo grafana/tempo -n monitoring --wait`

### Deploy Kubernetes Monitoring
* `helm upgrade --install kubernetes-monitoring grafana/k8s-monitoring -n monitoring --wait`

### Deploy Grafana
* `helm upgrade --install grafana grafana/grafana -f configs/grafana.yaml -n monitoring --wait`

### Take a look!
* Launch k9s and port forward grafana
* `./scripts/grafana-creds.sh | pbcopy`
* Open [Grafana](http://localhost:3000)
