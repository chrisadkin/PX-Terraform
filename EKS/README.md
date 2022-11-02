# Overview

Terraform configuration for creating an AWS Elastic Container Services cluster with the permissions necessary for depoying Portworx to.

## Prerequisites

To use this configuration you will need:

- [an AWS Account](https://signin.aws.amazon.com/signin?redirect_uri=https%3A%2F%2Fportal.aws.amazon.com%2Fbilling%2Fsignup%2Fresume&client_id=signup&code_challenge_method=SHA-256&code_challenge=D4Ggbzl5tnL0TF44U1cPT4gn97OZnIDn7Tiig3AO_Lw#/start)

- [the AWS CLI both installed and configured]()
-- [AWS CLI installation instructions can be found here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
-- [Instructions for configuring the AWS CLI can be found here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

- [The AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)

- [kubectl command line tool](https://kubernetes.io/docs/tasks/tools/)

## Deploying The Configuration

1. Edit the terraform.tfvars files

2. Initialise the configuration:

terraform init

3. Deploy the configuration:

terraform apply -auto-approve



