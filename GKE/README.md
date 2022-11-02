# Overview

Terraform configuration for creating a GCP Google Kubernetes Engine cluster with the permissions necessary for deploying Portworx to.

## Prerequisites

To use this configuration you will need:

- [a GCP Account](https://console.cloud.google.com/)

- [an installed GCP CLI](https://cloud.google.com/sdk/docs/install)
  - after installing gcloud, run:
```
gcloud init
```
  - add your account to the application default credentials (ADC)
```
gcloud auth application-default login
```
- [kubectl command line tool](https://kubernetes.io/docs/tasks/tools/)

## Deploying The Configuration

1. Create a terraform.tfvars files containing the following line:
```
project_id=<project id goes here>
```

2. By default the configuration will create a three node cluster:

- in the europe-west2 region
- with three worker nodes based on e2-standard-8 compute instances
- 1.22.12-gke.2300 kubernetes version

If these default values are acceptable proceed to step 3, otherwise add the following lines to the terraform.tfvars file:
```
region=<region name goes here>
machine_type=<compute instance type goes here>
kubernetes_version=<cluster name prefix goes here>
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
