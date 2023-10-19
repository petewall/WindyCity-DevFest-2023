setup:
	kind create cluster --config configs/cluster.yaml --name windycity-devfest-demo

kill:
	kind delete cluster --name windycity-devfest-demo

kubeconfig.yaml:
	kind get kubeconfig --name windycity-devfest-demo > kubeconfig.yaml
