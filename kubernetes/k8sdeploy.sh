#!/bin/bash	
cp -r template/ deployment

kubectl create namespace openslice
kubectl apply -f ./deployment/openslice-ingress.yaml

# wait for ingress to get IP address
INGRESSADDR=""
while [ -z $INGRESSADDR ]; do
  echo "Waiting for external IP"
  INGRESSADDR=$(kubectl -n openslice get ingress openslice-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  [ -z "$INGRESSADDR" ] && sleep 5
done
echo 'Found external IP: '$INGRESSADDR

find ./deployment/ -type f  -print0 |  xargs -0 sed -i "s/INGRESSADDR/$INGRESSADDR/g"

kubectl apply -f ./deployment/mysql-portal-claim0-persistentvolumeclaim.yaml

kubectl apply -f ./deployment/activemq-deployment.yaml
kubectl apply -f ./deployment/activemq-service.yaml

kubectl apply -f ./deployment/consul-deployment.yaml
kubectl apply -f ./deployment/consul-service.yaml

kubectl apply -f ./deployment/mysql-portal-deployment.yaml
kubectl apply -f ./deployment/mysql-portal-service.yaml

#kubectl apply -f ./deployment/keycloak-realm-config.yaml
kubectl create configmap keycloak-realm-config --from-file=./deployment/realm-export.json --namespace=openslice
kubectl apply -f ./deployment/keycloak-deployment.yaml
kubectl apply -f ./deployment/keycloak-service.yaml

kubectl apply -f ./deployment/osom-claim0-persistentvolumeclaim.yaml
kubectl apply -f ./deployment/osom-deployment.yaml
kubectl apply -f ./deployment/osom-service.yaml

kubectl apply -f ./deployment/manoclient-deployment.yaml
kubectl apply -f ./deployment/manoclient-service.yaml

kubectl apply -f ./deployment/osportalapi-claim0-persistentvolumeclaim.yaml
kubectl apply -f ./deployment/osportalapi-deployment.yaml
kubectl apply -f ./deployment/osportalapi-service.yaml

kubectl apply -f ./deployment/osscapi-claim0-persistentvolumeclaim.yaml
kubectl apply -f ./deployment/osscapi-deployment.yaml
kubectl apply -f ./deployment/osscapi-service.yaml

kubectl apply -f ./deployment/oasapi-claim0-persistentvolumeclaim.yaml
kubectl apply -f ./deployment/oasapi-deployment.yaml
kubectl apply -f ./deployment/oasapi-service.yaml

kubectl apply -f ./deployment/tmfweb-config.yaml
kubectl apply -f ./deployment/tmfweb-deployment.yaml
kubectl apply -f ./deployment/tmfweb-service.yaml

kubectl apply -f ./deployment/portalweb-config.yaml
kubectl apply -f ./deployment/portalweb-deployment.yaml
kubectl apply -f ./deployment/portalweb-service.yaml

kubectl apply -f ./deployment/centrallog-deployment.yaml
kubectl apply -f ./deployment/centrallog-service.yaml

kubectl apply -f ./deployment/bugzilla-client-deployment.yaml
kubectl apply -f ./deployment/bugzilla-client-service.yaml


