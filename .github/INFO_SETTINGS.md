# Github action example

## Environment secrets

Create two environments dev for dev branch deployment and prod for main branch deployment. Set the corresponding values for each environment.

The `build and test` workflow is defined to run when a pull request is open and when commits are pushed to the pull request.

The secrets needed for this workflow are:

- SEVERITY = HIGH (HIGH | LOW define the severity to be evaluate of the issues returned by gosec) (REPO)
- LIMIT_ISSUES = 0 (Int value this will be define the limit of issues allowed. 0 default) (REPO)

`Deploy dev` workflow is for deploy the service to the cluster using skaffold. It needs the following secrets:

- HARBOR_URL = url of harbor to upload docker images. (ORG)
- HARBOR_PASSWORD (ORG)
- HARBOR_USERNAME (ORG)
- K8S_SECRETS= base64 key=value secrets of service. (REPO)
- HAS_SECRETS= true or false. Flag to know if is needed to read and upload K8S_SECRETS. (REPO)
- DIGITALOCEAN_ACCESS_TOKEN= access token generated in Digital Ocean. (ORG)
- DIGITALOCEAN_CLUSTER_ID= id of cluster to get kubeconfig from digital ocean. (REPO)

## Branch protection rules

dev:

- push: no-one
- merge: developer
- approvals: two-developers

test:

- push: no-one
- merge: developer
- approvals: two-developers

staging:

- push:no-one
- merge:leader
- approvals:one-leader

main:

- push:no-one
- merge:leader
- approvals:two-leaders
