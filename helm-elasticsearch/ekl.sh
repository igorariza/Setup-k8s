helm  uninstall elasticsearch -n iot-dependencies

helm repo add elastic https://helm.elastic.co
# curl -O https://raw.githubusercontent.com/elastic/helm-charts/master/elasticsearch/examples/minikube/values.yaml


kubectl -n iot-dependencies apply -f volume-claim.yaml

helm install elasticsearch elastic/elasticsearch -n iot-dependencies -f ./values.yaml


helm  uninstall kibana -n iot-dependencies

helm  install kibana elastic/kibana -n iot-dependencies


kubectl -n iot-dependencies apply -f cluster-role.yaml

# kubectl -n ccp-dependencies apply -f create-cluster.yaml
# kubectl -n ccp-dependencies apply -f create-ns-topic.yaml

