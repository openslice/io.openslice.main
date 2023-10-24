#!/bin/bash

# Exit on error
set -e

# Function to log messages
log() {
  echo "[INFO] $1"
}

# Update OS
log "Updating OS..."
sudo apt-get update -y > /dev/null
sudo NEEDRESTART_FRONTEND=none DEBIAN_FRONTEND=noninteractive apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" > /dev/null
log "OS updated successfully."

# Install Docker if it's not already installed
if ! command -v docker &> /dev/null; then
    log "Installing Docker..."
    sudo apt-get install -y docker.io > /dev/null
    sudo systemctl enable docker > /dev/null
    sudo systemctl start docker > /dev/null
    log "Docker installed successfully."
fi

# Install kubectl if it's not already installed
if ! command -v kubectl &> /dev/null; then
    log "Installing kubectl..."
    sudo apt-get update && sudo apt-get install -y apt-transport-https > /dev/null
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - > /dev/null
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list > /dev/null
    sudo apt-get update > /dev/null
    sudo apt-get install -y kubectl > /dev/null
    log "kubectl installed successfully."
fi

# Install kind if it's not already installed
if ! command -v kind &> /dev/null; then
    log "Installing kind..."
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.12.0/kind-linux-amd64 > /dev/null
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/ > /dev/null
    log "kind installed successfully."
fi

# Check if a kind cluster already exists and create if it doesn't
if ! kind get clusters | grep -q 'kind'; then
    log "Creating kind cluster..."
    kind create cluster > /dev/null
    log "Kind cluster created successfully."
else
    log "Kind cluster already exists. Skipping creation."
fi

# Install helm if it's not already installed
if ! command -v helm &> /dev/null; then
    log "Installing helm..."
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 > /dev/null
    chmod 700 get_helm.sh
    ./get_helm.sh > /dev/null
    rm get_helm.sh
    log "Helm installed successfully."
fi

# Install ingress-nginx with helm
log "Installing ingress-nginx..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx > /dev/null
helm repo update > /dev/null
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace > /dev/null

# Wait for ingress-nginx to be ready
log "Waiting for ingress-nginx to be ready..."
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s > /dev/null
log "ingress-nginx is ready."

# Fetch the ClusterIP and Port of the ingress controller service
CLUSTER_IP=$(kubectl get svc -n ingress-nginx ingress-nginx-controller -o=jsonpath='{.spec.clusterIP}')
PORT=$(kubectl get svc -n ingress-nginx ingress-nginx-controller -o=jsonpath='{.spec.ports[?(@.name=="http")].port}')

# Set up iptables rules
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $CLUSTER_IP:$PORT
sudo iptables -t nat -A POSTROUTING -j MASQUERADE

# Clone the repository
if [ ! -d "io.openslice.main" ]; then
  log "Cloning repository..."
  git clone -b kubernetes https://github.com/openslice/io.openslice.main.git > /dev/null
  log "Repository cloned successfully."
else
  log "Repository already exists. Switching to kubernetes branch and pulling latest changes..."
  git fetch origin > /dev/null
  git checkout -B kubernetes origin/kubernetes > /dev/null
  git pull origin kubernetes > /dev/null
  cd ..
  log "Latest changes pulled successfully."
fi

# Find the host's IP address automatically
DEFAULT_IFACE=$(ip route show default | awk '/default/ {print $5}')
HOST_IP=$(ip -4 addr show $DEFAULT_IFACE | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Define the release name
RELEASE_NAME="my-openslice"

# Define a specific port for Keycloak
KEYCLOAK_PORT=31000  

# Change directory and run helm install
cd io.openslice.main/kubernetes/helm/openslice
log "Installing my-openslice..."
helm upgrade --install $RELEASE_NAME . -n openslice --create-namespace --set rooturl=http://$HOST_IP:$KEYCLOAK_PORT,mysql.storage="500Mi" > /dev/null

# Update services to NodePort
full_svc_name="${RELEASE_NAME}-${svc_suffix}"
log "Updating $full_svc_name service to use NodePort..."
kubectl patch svc ${RELEASE_NAME}-keycloak -n openslice --type='json' -p="[{'op': 'replace', 'path': '/spec/type', 'value': 'NodePort'}, {'op': 'replace', 'path': '/spec/ports/0/nodePort', 'value': $KEYCLOAK_PORT}]"

for svc_suffix in "keycloak" "portalweb" "tmfweb"; do
  full_svc_name="${RELEASE_NAME}-${svc_suffix}"
  log "Updating $full_svc_name service to use NodePort..."
  kubectl patch svc $full_svc_name -n openslice --type='json' -p="[{'op': 'replace', 'path': '/spec/type', 'value': 'NodePort'}]"
done

cd - > /dev/null
log "my-openslice installed successfully."

# Display the summary
log "=== Access Information ==="

# Fetch and display NodePorts for each service
for svc_suffix in "keycloak" "portalweb" "tmfweb"; do
  full_svc_name="${RELEASE_NAME}-${svc_suffix}"
  NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services $full_svc_name -n openslice)
  log "You can access $svc_suffix on ${HOST_IP}:${NODE_PORT}"
done
