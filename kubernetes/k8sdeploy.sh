#!/bin/bash	

CURRENT_DIR="$(pwd)"
SCRIPT_DIR="$(dirname "$0")"
cd $SCRIPT_DIR

# copy to a workingdir
cp -r ./template ./_apply

kubectl create namespace openslice

kubectl apply -f ./_apply/openslice-ingress.yaml

# wait for ingress to get IP address
INGRESSADDR=""
while [ -z $INGRESSADDR ]; do
  echo "Waiting for external IP"
  INGRESSADDR=$(kubectl -n openslice get ingress openslice-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  if [ -z "$INGRESSADDR" ]
  then
    echo "\INGRESSADDR is empty trying hostname"
    INGRESSADDR=$(kubectl -n openslice get ingress openslice-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
  else
    echo "\$INGRESSADDR found!"
  fi
  [ -z "$INGRESSADDR" ] && sleep 5
done
echo 'Found external IP: '$INGRESSADDR
find ./_apply/ -type f  -print0 |  xargs -0 sed -i "s/INGRESSADDR/$INGRESSADDR/g"

kubectl apply -f ./_apply/artemis.yaml
kubectl apply -f ./_apply/bugzilla.yaml
kubectl apply -f ./_apply/centrallog.yaml
kubectl apply -f ./_apply/manoclient.yaml
kubectl apply -f ./_apply/kroki.yaml
kubectl apply -f ./_apply/blockdiag.yaml

kubectl apply -f ./_apply/portalweb-config.yaml
kubectl apply -f ./_apply/portalweb-config-nginx.yaml
kubectl apply -f ./_apply/portalweb.yaml

kubectl apply -f ./_apply/tmfweb-config.yaml
kubectl apply -f ./_apply/tmfweb-config-nginx.yaml
kubectl apply -f ./_apply/tmfweb.yaml

kubectl apply -f ./_apply/mysql-config.yaml
kubectl apply -f ./_apply/mysql-pv-pvc.yaml
kubectl apply -f ./_apply/mysql.yaml

kubectl create configmap keycloak-realm-config --from-file=./_apply/realm-export.json --namespace=openslice
kubectl apply -f ./_apply/keycloak.yaml

kubectl apply -f ./_apply/osom-pv-pvc.yaml
kubectl apply -f ./_apply/osom.yaml

kubectl apply -f ./_apply/oasapi-pv-pvc.yaml
kubectl apply -f ./_apply/oasapi.yaml

kubectl apply -f ./_apply/osportalapi-pv-pvc.yaml
kubectl apply -f ./_apply/osportalapi.yaml

kubectl apply -f ./_apply/osscapi-pv-pvc.yaml
kubectl apply -f ./_apply/osscapi.yaml

kubectl apply -f ./_apply/front-networkpolicy.yaml
kubectl apply -f ./_apply/back-networkpolicy.yaml

cd $CURRENT_DIR
