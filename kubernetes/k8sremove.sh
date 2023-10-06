#!/bin/bash

CURRENT_DIR="$(pwd)"
SCRIPT_DIR="$(dirname "$0")"
cd $SCRIPT_DIR

kubectl delete -f ./_apply/front-networkpolicy.yaml
kubectl delete -f ./_apply/back-networkpolicy.yaml

kubectl delete -f ./_apply/osscapi.yaml
kubectl delete -f ./_apply/osscapi-pv-pvc.yaml

kubectl delete -f ./_apply/osportalapi.yaml
kubectl delete -f ./_apply/osportalapi-pv-pvc.yaml

kubectl delete -f ./_apply/oasapi.yaml
kubectl delete -f ./_apply/oasapi-pv-pvc.yaml

kubectl delete -f ./_apply/osom.yaml
kubectl delete -f ./_apply/osom-pv-pvc.yaml

kubectl delete -f ./_apply/portainer.yaml
kubectl delete -f ./_apply/portainer-pvc.yaml

kubectl delete -f ./_apply/keycloak.yaml
kubectl delete configmap keycloak-realm-config -n openslice

kubectl delete -f ./_apply/mysql.yaml
kubectl delete -f ./_apply/mysql-pv-pvc.yaml
kubectl delete -f ./_apply/mysql-config.yaml

kubectl delete -f ./_apply/tmfweb-config.yaml
kubectl delete -f ./_apply/tmfweb-config-nginx.yaml
kubectl delete -f ./_apply/tmfweb.yaml

kubectl delete -f ./_apply/portalweb-config.yaml
kubectl delete -f ./_apply/portalweb-config-nginx.yaml
kubectl delete -f ./_apply/portalweb.yaml

kubectl delete -f ./_apply/blockdiag.yaml
kubectl delete -f ./_apply/kroki.yaml
kubectl delete -f ./_apply/manoclient.yaml
kubectl delete -f ./_apply/centrallog.yaml
kubectl delete -f ./_apply/bugzilla.yaml
kubectl delete -f ./_apply/artemis.yaml

kubectl delete -f ./_apply/openslice-ingress.yaml

kubectl delete ns openslice

cd $CURRENT_DIR
