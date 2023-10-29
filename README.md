
# Python Application on AWS EKS

Welcome to the official README for the Python application deployed on Amazon Web Services (AWS) Elastic Kubernetes Service (EKS). This document provides a brief introduction to the deployment, highlighting the key components and technologies involved.

Application: This Python application is containerized as a Docker image on Docker Hub and deployed on AWS EKS using Kubernetes.

## Deployment Structure
The deployment consist of the following components
# Components

| Component                  |  |
|----------------------------|----------|
| 1. VPC                     |    ✅   |
| 2. Private and Public Subnets |  ✅   |
| 3. Route Tables            |    ✅   |
| 4. NAT Gateways            |    ✅   |
| 5. Load Balancers          |    ✅   |
| 6. EC2 Instance (Node)     |    ✅   |
| 7. EKS                     |    ✅   |

| Component                  | Required |
|----------------------------|----------|
| 1 Service                     |    ✅   |
| 1 Deployment |  ✅   |
| 3 Pods            |    ✅   |

## Getting Started 

### Prerequisites

Before you begin, ensure you have the following prerequisites in place:

1. **Ubuntu Linux Machine**: This Deployment is designed to run on an Ubuntu Linux machine. Ensure you have an Ubuntu-based system available.

2. **AWS CLI Installed and Access Keys Configured**: To interact with AWS services, you'll need the AWS Command Line Interface (CLI) installed on your machine. Additionally, configure your AWS access keys to authenticate with AWS. You can set up access keys using the `aws configure` command.

3. **Terraform Installed**: This project relies on Terraform for infrastructure provisioning. Make sure you have Terraform installed on your Ubuntu machine. You can find installation instructions for Terraform on the [official Terraform website](https://www.terraform.io/downloads.html).

Deployment Configuration: The head to the project folder, you should find a file named `deploy.sh` execute the file using the command below.
```sh
deploy.sh
```

The bash script consist of the steps below.

* Install AWS CLI
* Install kubectl usint apt-get
* Initialize Terraform in the Project Directory
* Apply and provision terraform code
* Configure kubectl with aws command line
* Create kubernetes deployment
* Create Kuberentes Service





## Confirm Deployment

The bash script, provisions the EKS cluster by provisioning the Terraform infrasctructure. It performs this by first installing `kubectl` on the linux machine, then provision the EKS infrasctructure, by executing the terraform commands to apply the infrasctructure.

To run the python application on the alreacy provisioned infrasctructure, the bash script applies a kubernetes `deployment`, and then applies a `service` to expose the pods to the outside world. 

Execute the below command to see the the service created
```sh
kubectl get svc
```
You should have a list of services like this
![image](https://github.com/realexcel2021/rebase-project/assets/89150996/c7320b61-b2f2-4a9d-af8c-1022ee1d0b03)
You can then access the application on the load balancer link provided by the service

You can also see list of running pods by executing the command
```sh
kubectl get pods
```
![image](https://github.com/realexcel2021/rebase-project/assets/89150996/8b395868-49e9-487c-b30f-b5458d83f4f6)


## Destroy Infrastructure

To destroy the provisioned EKS Infrastructure, execute the command below
This command, removes the whole infrastructure from the AWS account and cleans up the project from the configuration

`````sh
kubectl delete deployment.yml
kubectl delete service.yml
terraform destroy -auto-approve
`````
or you can run the `destroy.sh` bash script by passing the command below

```sh
sh destroy.sh
```
![image](https://github.com/realexcel2021/rebase-project/assets/89150996/d9f5e30c-1f7f-41f6-a7e0-a32d4166de12)
