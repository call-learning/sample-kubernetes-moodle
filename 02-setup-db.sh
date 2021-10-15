#!/bin/bash
if [ ! -z "$KUBECONFIG" ]; then
 echo "KUBECONFIG is set, let's not run this on a real cluster..."
 exit
fi

set -x

helm upgrade --install postgres-operator ./charts/postgres-operator/charts/postgres-operator/
sleep 3
kubectl apply -f kubernetes/dbcluster.yaml
