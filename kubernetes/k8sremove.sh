#!/bin/bash

kubectl delete -f activemq-service.yaml
kubectl delete -f activemq-deployment.yaml


kubectl delete -f consul-service.yaml
kubectl delete -f consul-deployment.yaml

kubectl delete -f mysql-portal-service.yaml
kubectl delete -f mysql-portal-deployment.yaml

#kubectl delete -f keycloak-realm-config.yaml
kubectl delete configmap keycloak-realm-config
kubectl delete -f keycloak-service.yaml
kubectl delete -f keycloak-deployment.yaml

kubectl delete -f osom-service.yaml
kubectl delete -f osom-deployment.yaml

kubectl delete -f manoclient-service.yaml
kubectl delete -f manoclient-deployment.yaml

kubectl delete -f osportalapi-service.yaml
kubectl delete -f osportalapi-deployment.yaml

kubectl delete -f osscapi-service.yaml
kubectl delete -f osscapi-deployment.yaml

kubectl delete -f tmfweb-config.yaml
kubectl delete -f tmfweb-service.yaml
kubectl delete -f tmfweb-deployment.yaml

kubectl delete -f portalweb-config.yaml
kubectl delete -f portalweb-service.yaml
kubectl delete -f portalweb-deployment.yaml

kubectl delete -f centrallog-service.yaml
kubectl delete -f centrallog-deployment.yaml

kubectl delete -f bugzilla-client-service.yaml
kubectl delete -f bugzilla-client-deployment.yaml




kubectl delete -f mysql-portal-claim0-persistentvolumeclaim.yaml
kubectl delete -f osom-claim0-persistentvolumeclaim.yaml
kubectl delete -f osportalapi-claim0-persistentvolumeclaim.yaml
kubectl delete -f osscapi-claim0-persistentvolumeclaim.yaml

