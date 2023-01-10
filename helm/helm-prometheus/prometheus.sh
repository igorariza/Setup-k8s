helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo add grafana https://grafana.github.io/helm-charts

helm repo update

helm -n iot-dependencies install prometheus prometheus-community/prometheus

helm -n iot-dependencies install grafana grafana/grafana

kubectl get secret --namespace iot-dependencies grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo