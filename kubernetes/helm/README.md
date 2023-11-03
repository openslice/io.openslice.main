# OpenSlice Installation Guide with Helm

## Pre-requisites

### Required Software

- A Kubernetes cluster up and running with enough disk to allocate about 12GB of PV storage. (Storage requirements can be changed in the respective PV/PVC templates)
- Helm installed for managing Kubernetes packages.
  
### Additional Configuration

- **Ingress Controller**: An Nginx ingress controller is required. If you use another type of ingress controller, you'll need to modify `[repo-root]/kubernetes/helm/openslice/templates/openslice-ingress.yaml` to conform to your ingress controller's requirements.
  
- **Storage Class**: Define your type of `storageClass` in `[repo-root]/kubernetes/helm/openslice/values.yaml` under `storageClass`. If this is not defined, the PVs (Persistent Volumes) will be created and managed manually by the Helm chart.

- **Domain/IP Address**: You need to have a domain or an IP address to access the application. This should be defined in `[repo-root]/kubernetes/helm/openslice/values.yaml` under `rooturl`.

# Install helm chart
```
helm install myopenslice ./openslice --namespace openslice --create-namespace
```

# Uninstall helm chart
```
helm uninstall myopenslice --namespace openslice
```
