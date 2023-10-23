create-cluster:
	kind create cluster --config configs/cluster.yaml --name windycity-devfest-demo

kubeconfig.yaml:
	kind get kubeconfig --name windycity-devfest-demo > kubeconfig.yaml
	chmod 600 kubeconfig.yaml

kill-cluster:
	kind delete cluster --name windycity-devfest-demo
