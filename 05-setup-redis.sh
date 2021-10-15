#!/bin/bash
if [ ! -z "$KUBECONFIG" ]; then
 echo "KUBECONFIG is set, let's not run this on a real cluster..."
 exit
fi

kubectl create -f https://raw.githubusercontent.com/spotahome/redis-operator/master/example/operator/all-redis-operator-resources.yaml

kubectl apply -f kubernetes/redis.yaml

set -x
kubectl delete configmap testk8smoodle-moodle-k8s-moodle-config
kubectl apply -f kubernetes/configmaps/configphp-redis.yaml
kubectl apply -f kubernetes/phpfpm.yaml
kubectl apply -f kubernetes/webserver.yaml

kubectl rollout restart deployment testk8smoodle-moodle-k8s-webserver
kubectl rollout restart deployment testk8smoodle-moodle-k8s-phpfpm


