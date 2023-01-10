BUILDPATH=$(CURDIR)
API_NAME=cluster
# external services required to run the service
create: 
	@k3d cluster create ccp-local --servers 3 --api-port 6550 -p "8081:80@loadbalancer" --agents 2 --kubeconfig-switch-context

helm:
	@brew install helm

create-ns:
	@kubectl create ns ccp-shared
	@kubectl create ns ccp-dev

vault:
	@helm repo add hashicorp https://helm.releases.hashicorp.com
	@helm install vault hashicorp/vault --namespace ccp-shared

 
.PHONY: test


kubectl create secret generic adminusercredentials --from-literal=Username='root' --from-literal=Password='abcdfg'