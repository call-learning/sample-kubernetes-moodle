#!/bin/bash
if [ ! -z "$KUBECONFIG" ]; then
 echo "KUBECONFIG is set, let's not run this on a real cluster..."
 exit
fi

helm repo add ot-helm https://ot-container-kit.github.io/helm-charts/
helm upgrade redis-operator ot-helm/redis-operator --install
set -x
kubectl apply -f kubernetes/redisstandalone.yaml
kubectl delete configmap testk8smoodle-moodle-k8s-moodle-config
kubectl apply -f kubernetes/configmaps/configphp-redis.yaml

kubectl rollout restart deployment testk8smoodle-moodle-k8s-webserver
kubectl rollout restart deployment testk8smoodle-moodle-k8s-phpfpm


