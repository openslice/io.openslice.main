# First Create PVs

Create them, for example:

```
apiVersion: v1
kind: PersistentVolume
metadata:
  namespace: openslice
  name: mysql-pv-volume
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/dockerdata-nfs/osmysql"
---
apiVersion: v1
kind: PersistentVolume
metadata:
  namespace: openslice
  name: osom-pv-volume
  labels:
    type: local
spec:
  storageClassName: osom-pv-manual
  capacity:
    storage: 100Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/dockerdata-nfs/osom"
---
apiVersion: v1
kind: PersistentVolume
metadata:
  namespace: openslice
  name: osportalapi-pv-volume
  labels:
    type: local
spec:
  storageClassName: osportalapi-pv-volume
  capacity:
    storage: 100Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/dockerdata-nfs/osportalapi-pv-volume"
---
apiVersion: v1
kind: PersistentVolume
metadata:
  namespace: openslice
  name: osscapi-pv-volume
  labels:
    type: local
spec:
  storageClassName: osscapi-pv-manual
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/dockerdata-nfs/osscapi"
---

```

# Install helm chart

helm install  myopens ./openslice --namespace openslice

# Uninstall helm chart

helm uninstall  myopens --namespace openslice
