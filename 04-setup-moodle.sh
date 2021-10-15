#!/bin/bash
if [ ! -z "$KUBECONFIG" ]; then
 echo "KUBECONFIG is set, let's not run this on a real cluster..."
 exit
fi
set -x
kubectl delete secret testk8smoodle-moodle-k8s-ssl-certificates
kubectl create secret generic testk8smoodle-moodle-k8s-ssl-certificates --from-file=ssl.cer=./kubernetes/certificates/\*.minikube.call-learning.io/\*.minikube.call-learning.io.cer --from-file=ssl.key=./kubernetes/certificates/\*.minikube.call-learning.io/\*.minikube.call-learning.io.key
kubectl apply -f kubernetes/serviceaccount.yaml
kubectl apply -f kubernetes/dbcluster.yaml
kubectl apply -f kubernetes/lb.yaml
kubectl apply -f kubernetes/pv.yaml
kubectl apply -f kubernetes/phpfpm.yaml
kubectl apply -f kubernetes/webserver.yaml
