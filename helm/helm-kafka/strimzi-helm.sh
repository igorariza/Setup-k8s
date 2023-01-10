helm -n iot-dependencies uninstall strimzi-kafka

helm repo add strimzi https://strimzi.io/charts/
helm -n iot-dependencies install strimzi-kafka strimzi/strimzi-kafka-operator

kubectl -n iot-services apply -f cluster-role.yaml
kubectl -n iot-dependencies apply -f create-cluster.yaml
kubectl -n iot-dependencies apply -f create-ns-topic.yaml
