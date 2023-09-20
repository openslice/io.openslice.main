#!/bin/bash

CURRENT_DIR="$(pwd)"
SCRIPT_DIR="$(dirname "$0")"
cd $SCRIPT_DIR

kubectl delete -f ./template/openslice-ingress.yaml

kubectl delete -f ./template/front-networkpolicy.yaml
kubectl delete -f ./template/back-networkpolicy.yaml

kubectl delete -f ./template/nginx.yaml
kubectl delete -f ./template/nginx-config.yaml
kubectl delete -f ./template/nginx-certs.yaml

kubectl delete -f ./template/osscapi.yaml
kubectl delete -f ./template/osscapi-pv-pvc.yaml

kubectl delete -f ./template/osportalapi.yaml
kubectl delete -f ./template/osportalapi-pv-pvc.yaml

kubectl delete -f ./template/oasapi.yaml
kubectl delete -f ./template/oasapi-pv-pvc.yaml

kubectl delete -f ./template/osom.yaml
kubectl delete -f ./template/osom-pv-pvc.yaml

kubectl delete -f ./template/portainer.yaml
kubectl delete -f ./template/portainer-pvc.yaml

kubectl delete -f ./template/keycloak.yaml
kubectl delete configmap keycloak-realm-config -n openslice

kubectl delete -f ./template/mysql.yaml
kubectl delete -f ./template/mysql-pv-pvc.yaml
kubectl delete -f ./template/mysql-configmap.yaml

kubectl delete -f ./template/blockdiag.yaml
kubectl delete -f ./template/kroki.yaml
kubectl delete -f ./template/manoclient.yaml
kubectl delete -f ./template/centrallog.yaml
kubectl delete -f ./template/bugzilla.yaml
kubectl delete -f ./template/artemis.yaml

kubectl delete ns openslice

cd $CURRENT_DIR
