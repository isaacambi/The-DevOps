#!/bin/bash


# Install aws cli

sudo apt-get install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Kubectl
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Terraform installation

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y

# Initialize Terraform
terraform init

# Apply Terraform Configuration (Creates EKS Cluster and Kubernetes Resources)
terraform apply -auto-approve

# # Retrieve EKS Cluster Name and Region from Terraform Output
EKS_CLUSTER_NAME=$(terraform output eks_cluster_name)
AWS_REGION=$(terraform output aws_region)

# # Configure kubectl with AWS CLI
aws eks --region us-east-1 update-kubeconfig --name test-eks-cluster-python-1

# Apply Kubernetes Manifests (Deployment, Service, etc.)
kubectl apply -f deployment.yml
kubectl apply -f service.yml
