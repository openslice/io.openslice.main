kubectl create namespace openslice

kubectl apply -f openslice-ingress.yaml

kubectl apply -f mysql-portal-claim0-persistentvolumeclaim.yaml

kubectl apply -f activemq-service.yaml
kubectl apply -f activemq-deployment.yaml

kubectl apply -f consul-service.yaml
kubectl apply -f consul-deployment.yaml

kubectl apply -f mysql-portal-service.yaml
kubectl apply -f mysql-portal-deployment.yaml

#kubectl apply -f keycloak-realm-config.yaml
kubectl create configmap keycloak-realm-config --from-file=realm-export.json
kubectl apply -f keycloak-service.yaml
kubectl apply -f keycloak-deployment.yaml

kubectl apply -f osom-claim0-persistentvolumeclaim.yaml
kubectl apply -f osom-service.yaml
kubectl apply -f osom-deployment.yaml

kubectl apply -f manoclient-service.yaml
kubectl apply -f manoclient-deployment.yaml

kubectl apply -f osportalapi-claim0-persistentvolumeclaim.yaml
kubectl apply -f osportalapi-service.yaml
kubectl apply -f osportalapi-deployment.yaml

kubectl apply -f osscapi-claim0-persistentvolumeclaim.yaml
kubectl apply -f osscapi-service.yaml
kubectl apply -f osscapi-deployment.yaml

kubectl apply -f tmfweb-config.yaml
kubectl apply -f tmfweb-service.yaml
kubectl apply -f tmfweb-deployment.yaml

kubectl apply -f portalweb-config.yaml
kubectl apply -f portalweb-service.yaml
kubectl apply -f portalweb-deployment.yaml

kubectl apply -f centrallog-service.yaml
kubectl apply -f centrallog-deployment.yaml

kubectl apply -f bugzilla-client-service.yaml
kubectl apply -f bugzilla-client-deployment.yaml


