kubectl create namespace kuberhealthy
helm repo add kuberhealthy https://kuberhealthy.github.io/kuberhealthy/helm-repos
helm install -n kuberhealthy kuberhealthy kuberhealthy/kuberhealthy

helm install --set prometheus.enabled=true -n kuberhealthy kuberhealthy kuberhealthy/kuberhealthy