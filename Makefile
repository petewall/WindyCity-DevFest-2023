setup:
	kind create cluster --config cluster-config.yaml --name windycity-devfest-demo

kubeconfig.yaml:
	kind get kubeconfig --name windycity-devfest-demo > $$KUBECONFIG

kubernetes-mixin/jsonnetfile.json: vendir.yml
	vendir sync

kubernetes-mixin/jsonnetfile.lock.json: kubernetes-mixin/jsonnetfile.json
	cd kubernetes-mixin && jb install

kubernetes-mixin/prometheus_rules.yaml: kubernetes-mixin/jsonnetfile.lock.json
	cd kubernetes-mixin && make prometheus_rules.yaml

