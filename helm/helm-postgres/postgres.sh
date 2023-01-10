kubectl create ns iot-storages

helm -n iot-storages delete postgresv1

helm -n iot-storages repo add bitnami https://charts.bitnami.com/bitnami

helm -n iot-storages install postgresv1 \
  --set postgresqlPassword=abcdefg, \
  --set postgresqlDatabase=iot_dev_db, \
  --set service.type=ClusterIP, \
  --set service.port=5432, \
  --set service.portName=postgres \
    bitnami/postgresql