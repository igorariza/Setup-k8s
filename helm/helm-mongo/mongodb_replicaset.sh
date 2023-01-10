helm -n develop repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade --install mongov1 bitnami/mongodb -n develop --create-namespace --version 13.6.2 \
    --set auth.enabled=true, \
    --set auth.rootPassword=abcdefg, \
    --set auth.username=root, \
    --set auth.password=abcdefg, \
    --set auth.database=ccp, \
    --set service.type=ClusterIP, \
    --set service.port=27017, \
    --set service.portName=mongodb, \
    --set architecture=replicaset, \
    --set replicaSetName=rs0