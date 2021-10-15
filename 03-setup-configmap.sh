#!/bin/bash
if [ ! -z "$KUBECONFIG" ]; then
 echo "KUBECONFIG is set, let's not run this on a real cluster..."
 exit
fi
set -x
kubectl delete configmap moodle-values
kubectl create configmap moodle-values --from-literal=domain_name='https://$HOSTNAME.minikube.call-learning.io'
kubectl delete configmap testk8smoodle-moodle-k8s-moodle-config
kubectl apply -f kubernetes/configmaps/configphp.yaml
kubectl delete configmap testk8smoodle-moodle-k8s-init-script
kubectl apply -f kubernetes/configmaps/initscript.yaml
kubectl delete secrets moodle-db-secret
kubectl apply -f kubernetes/configmaps/moodledbsecrets.yaml
kubectl delete configmap testk8smoodle-moodle-k8s-apache-vhosts
kubectl apply -f kubernetes/configmaps/vhosts.yaml
