create-cluster:
	kind create cluster --config configs/cluster.yaml --name windycity-devfest-demo

kubeconfig.yaml:
	kind get kubeconfig --name windycity-devfest-demo > kubeconfig.yaml
	chmod 600 kubeconfig.yaml

reset:
	helm delete grafana -n monitoring
	helm delete kubernetes-monitoring -n monitoring
	helm delete tempo -n monitoring
	helm delete loki -n monitoring
	helm delete prometheus -n monitoring

kill-cluster:
	kind delete cluster --name windycity-devfest-demo
