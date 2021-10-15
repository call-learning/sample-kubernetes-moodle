#!/bin/bash
if [ ! -z "$KUBECONFIG" ]; then
 echo "KUBECONFIG is set, let's not run this on a real cluster..."
 exit
fi

# Setup NFS server
# This will create a self signed certificate for Minio and so we will be able to connect in HTTPS
NFS_STORAGE_SIZE="10Gi"
NFS_STORAGE_CLASS="standard"
[ ! -z "$1" ] && NFS_STORAGE_SIZE="$1"
[ ! -z "$2" ] && NFS_STORAGE_CLASS="$2"

helm repo add stable https://charts.helm.sh/stable

cat <<- EOF | helm upgrade --install nfs-server stable/nfs-server-provisioner -f -
persistence:
  enabled: true
  storageClass: "$NFS_STORAGE_CLASS"
  size: $NFS_STORAGE_SIZE
storageClass:
  name: nfs
EOF
