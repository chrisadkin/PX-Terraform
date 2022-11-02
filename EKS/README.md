# Overview

Terraform configuration for creating an AWS Elastic Container Services cluster with the permissions necessary for deploying Portworx to.

## Prerequisites

To use this configuration you will need:

- [an AWS Account](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fportal.aws.amazon.com%2Fbilling%2Fsignup%2Fresume&client_id=signup&code_challenge_method=SHA-256&code_challenge=D4Ggbzl5tnL0TF44U1cPT4gn97OZnIDn7Tiig3AO_Lw#/start)

- [to install and configure the AWS CLI]
  - [AWS CLI installation instructions can be found here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
  - [Instructions for configuring the AWS CLI can be found here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

- [The AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)

- [kubectl command line tool](https://kubernetes.io/docs/tasks/tools/)

## Deploying The Configuration

1. By default the configuration will create a three node cluster:

- in the us-east2 region
- with three worker nodes based on c4.2xlarge EC2 instances
- with the name portworx- followed by a randomly generated string suffix

If these default values are acceptable proceed to step 2, otherwise create a terraform.tfvars file with the following contents:
```
region=<region name goes here>
ec2_instance_type=<instance type goes here>
cluster_name=<cluster name prefix goes here>
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

Issue the following command, substituting the placeholders in angular brackets as appropriate: 
```
aws eks update-kubeconfig --region <region-code> --name <my-cluster>
```

## Destroying The Resources Deployed By The Configuration
```
terraform destroy -auto-approve
```
