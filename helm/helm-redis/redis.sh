kubectl create ns iot-storages

helm -n iot-storages delete redis

helm -n iot-storages repo add bitnami https://charts.bitnami.com/bitnami

helm -n iot-storages install redis bitnami/redis

export REDIS_PASSWORD=$(kubectl get secret --namespace iot-storages redis -o jsonpath="{.data.redis-password}" | base64 -d) ; echo $REDIS_PASSWORD