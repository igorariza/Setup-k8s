kubectl create ns iot-storages

helm -n iot-storages delete mongov1

helm -n iot-storages repo add bitnami https://charts.bitnami.com/bitnami
helm -n iot-storages install mongov1 \
    --set auth.enabled=true, \
    --set auth.rootPassword=abcdefg, \
    --set auth.username=iot, \
    --set auth.password=abcdefg, \
    --set auth.database=iot, \
    --set service.type=ClusterIP, \
    --set service.port=27017, \
    --set service.portName=mongodb, \
    --set architecture=replicaset, \
    --set replicaSetName=rs0 \
    bitnami/mongodb
