#!/bin/bash

kubectl delete -f ./deployment/activemq-service.yaml
kubectl delete -f ./deployment/activemq-deployment.yaml


kubectl delete -f ./deployment/consul-service.yaml
kubectl delete -f ./deployment/consul-deployment.yaml

kubectl delete -f ./deployment/mysql-portal-service.yaml
kubectl delete -f ./deployment/mysql-portal-deployment.yaml

#kubectl delete -f keycloak-realm-config.yaml
kubectl delete configmap keycloak-realm-config -n openslice
kubectl delete -f ./deployment/keycloak-service.yaml
kubectl delete -f ./deployment/keycloak-deployment.yaml

kubectl delete -f ./deployment/osom-service.yaml
kubectl delete -f ./deployment/osom-deployment.yaml

kubectl delete -f ./deployment/manoclient-service.yaml
kubectl delete -f ./deployment/manoclient-deployment.yaml

kubectl delete -f ./deployment/osportalapi-service.yaml
kubectl delete -f ./deployment/osportalapi-deployment.yaml

kubectl delete -f ./deployment/osscapi-service.yaml
kubectl delete -f ./deployment/osscapi-deployment.yaml

kubectl delete -f ./deployment/oasapi-service.yaml
kubectl delete -f ./deployment/oasapi-deployment.yaml

kubectl delete -f ./deployment/tmfweb-config.yaml
kubectl delete -f ./deployment/tmfweb-service.yaml
kubectl delete -f ./deployment/tmfweb-deployment.yaml

kubectl delete -f ./deployment/portalweb-config.yaml
kubectl delete -f ./deployment/portalweb-service.yaml
kubectl delete -f ./deployment/portalweb-deployment.yaml

kubectl delete -f ./deployment/centrallog-service.yaml
kubectl delete -f ./deployment/centrallog-deployment.yaml

kubectl delete -f ./deployment/bugzilla-client-service.yaml
kubectl delete -f ./deployment/bugzilla-client-deployment.yaml

kubectl delete -f ./deployment/mysql-portal-claim0-persistentvolumeclaim.yaml
kubectl delete -f ./deployment/osom-claim0-persistentvolumeclaim.yaml
kubectl delete -f ./deployment/osportalapi-claim0-persistentvolumeclaim.yaml
kubectl delete -f ./deployment/osscapi-claim0-persistentvolumeclaim.yaml
kubectl delete -f ./deployment/oasapi-claim0-persistentvolumeclaim.yaml

kubectl delete -f ./deployment/openslice-ingress.yaml

rm -r deployment
