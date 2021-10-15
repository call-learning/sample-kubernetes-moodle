#!/bin/bash
if [ ! -z "$KUBECONFIG" ]; then
 echo "KUBECONFIG is set, let's not run this on a real cluster..."
 exit
fi

set -x

helm install postgres-operator ./charts/postgres-operator/charts/postgres-operator/
kubectl apply -f kubernetes/dbcluster.yaml
# helm upgrade --install mysqloperator ./mysql-operator/deploy/charts/mysql-operator
#
# # cat <<- EOF | helm upgrade --install mysqloperator ./mysql-operator/deploy/charts/mysql-operator -f -
# # replicas: 1
# # image: bitpoke/mysql-operator:v0.5.1
# # sidecarImage: bitpoke/mysql-operator-sidecar-5.7:v0.5.1
# # sidecarMysql8Image: bitpoke/mysql-operator-sidecar-8.0:v0.5.1
# # orchestrator:
# #   image: bitpoke/mysql-operator-orchestrator:v0.5.1
# # EOF
