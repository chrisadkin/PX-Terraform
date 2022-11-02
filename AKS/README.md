# Overview

Terraform configuration for creating an Azure Azure Kubernetes Service cluster with the permissions necessary for deploying Portworx to.

## Prerequisites

To use this configuration you will need:

- [an Azure account](https://portal.azure.com/#home)

- [an installed Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
  - after installing the az CLI, run:
```
az login
```
## Deploying The Configuration

1. By default the configuration will create a three node cluster:

- in the uksouth region
- with three worker nodes based on standard_d8as_v4 virtual machines

If these default values are acceptable proceed to step 2, otherwise create a terraform.tfvars file with the following contents:
```
region=<region name goes here>
vmsize=<virtual machine type goes here>
```
2. Initialise the configuration:
```
terraform init
```
3. This step is optional, inspect the resources that the configuration will create:
```
terraform plan  
```  
4. Deploy the configuration:
```
terraform apply -auto-approve
```

## Kubeconfig File Creation

1. Install the gke plugin:
```
gcloud components install gke-gcloud-auth-plugin
```
2. Check the gke-gcloud-auth-plugin binary version:
```
gke-gcloud-auth-plugin --version
```
3. Update your kubeconfig:
```
gcloud container clusters get-credentials <cluster_name> --region <region>
```

## Destroying The Resources Deployed By The Configuration
```
terraform destroy -auto-approve
```
