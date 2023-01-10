kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.29.0/release.yaml

kubectl apply --filename https://github.com/tektoncd/dashboard/releases/latest/download/tekton-dashboard-release.yaml

kubectl -n tekton-pipelines apply -f cat-file.yaml
kubectl -n tekton-pipelines apply -f gitclone.yaml
kubectl -n tekton-pipelines apply -f kaniko.yaml
kubectl -n tekton-pipelines apply -f kubernetes-actions.yaml
kubectl -n tekton-pipelines apply -f list-workspace.yaml
kubectl -n tekton-pipelines apply -f write-file-ws.yaml

kubectl -n ccp-dependencies apply -f servicemonitor.yaml

