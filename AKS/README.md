# Overview

Terraform configuration for creating an Azure Azure Kubernetes Service cluster with the permissions necessary for deploying Portworx to.

## Prerequisites

To use this configuration you will need:

- [an Azure account](https://portal.azure.com/#home)

- [to install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
  - after installing the az CLI, run:
```
az login
```
## Deploying The Configuration

1. Create a terraform.tfvars files containing the your Azure subscription id and tenant id:
```
subscription_id=<your Azure subscription id goes here>
tenant_id=<your Azure tenant id goes here>
```

2. By default the configuration will create a three node cluster:

- named portworx
- that resides in a portworx resource group
- in the uksouth region
- with three worker nodes based on standard_d8as_v4 virtual machines

If these default values are acceptable proceed to step 3, otherwise add the following lines to the terraform.tfvars file:
```
cluster_name=<cluster name goes here>
resource_group=<resource group goes here>
region=<region name goes here>
vmsize=<virtual machine type goes here>
```
3. Initialise the configuration:
```
terraform init
```
4. This step is optional, inspect the resources that the configuration will create:
```
terraform plan  
```  
5. Deploy the configuration:
```
terraform apply -auto-approve
```

## Kubeconfig File Creation

The configuration will automatically update the ~/.kube/config file.

## Destroying The Resources Deployed By The Configuration
```
terraform destroy -auto-approve
```
