#!/bin/bash
if [ ! -z "$KUBECONFIG" ]; then
 echo "KUBECONFIG is set, let's not run this on a real cluster..."
 exit
fi

MYSQL_OPERATOR_VERSION="0.4.x"
REDIS_OPERATOR_VERSION="v1.0.0"
CALL_LEARNING_UBUNTU_VERSION="s1.0.0"
# Add images to local cache

for IMAGE in `docker image ls --filter "reference=mysql-operator/*:${MYSQL_OPERATOR_VERSION}" --filter "reference=redis-operator/*:${REDIS_OPERATOR_VERSION}" --filter "reference=calllearning/ubuntu-*:${CALL_LEARNING_UBUNTU_VERSION}" --format "{{.Repository}}:{{.Tag}}"`
do
    echo "Check that image $IMAGE is on minikube cache"
    [ `minikube image ls | grep -q $IMAGE` ] || minikube image load $IMAGE
done

minikube cache reload

