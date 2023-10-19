setup:
	kind create cluster --config cluster-config.yaml --name windycity-devfest-demo

kubeconfig.yaml:
	kind get kubeconfig --name windycity-devfest-demo > $$KUBECONFIG
