#!/bin/bash	

CURRENT_DIR="$(pwd)"
SCRIPT_DIR="$(dirname "$0")"
cd $SCRIPT_DIR

kubectl create namespace openslice

kubectl apply -f ./template/artemis.yaml
kubectl apply -f ./template/bugzilla.yaml
kubectl apply -f ./template/centrallog.yaml
kubectl apply -f ./template/manoclient.yaml
kubectl apply -f ./template/kroki.yaml
kubectl apply -f ./template/blockdiag.yaml

kubectl apply -f ./template/mysql-configmap.yaml
kubectl apply -f ./template/mysql-pv-pvc.yaml
kubectl apply -f ./template/mysql.yaml

kubectl create configmap keycloak-realm-config --from-file=./template/realm-export.json --namespace=openslice
kubectl apply -f ./template/keycloak.yaml

kubectl apply -f ./template/portainer-pvc.yaml
kubectl apply -f ./template/portainer.yaml

kubectl apply -f ./template/osom-pv-pvc.yaml
kubectl apply -f ./template/osom.yaml

kubectl apply -f ./template/oasapi-pv-pvc.yaml
kubectl apply -f ./template/oasapi.yaml

kubectl apply -f ./template/osportalapi-pv-pvc.yaml
kubectl apply -f ./template/osportalapi.yaml

kubectl apply -f ./template/osscapi-pv-pvc.yaml
kubectl apply -f ./template/osscapi.yaml

kubectl apply -f ./template/nginx-certs.yaml
kubectl apply -f ./template/nginx-config.yaml
kubectl apply -f ./template/nginx.yaml

kubectl apply -f ./template/front-networkpolicy.yaml
kubectl apply -f ./template/back-networkpolicy.yaml

kubectl apply -f ./template/openslice-ingress.yaml

# wait for ingress to get IP address
# INGRESSADDR=""
# while [ -z $INGRESSADDR ]; do
#   echo "Waiting for external IP"
#   INGRESSADDR=$(kubectl -n openslice get ingress openslice-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
#   [ -z "$INGRESSADDR" ] && sleep 5
# done
# echo 'Found external IP: '$INGRESSADDR

# find ./template/ -type f  -print0 |  xargs -0 sed -i "s/INGRESSADDR/$INGRESSADDR/g"

# kubectl apply -f ./template/tmfweb-config.yaml
# kubectl apply -f ./template/tmfweb-template.yaml
# kubectl apply -f ./template/tmfweb-service.yaml

cd $CURRENT_DIR
