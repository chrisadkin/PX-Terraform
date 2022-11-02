# PX-Terraform

## Overview

This repo contains Terraform configurations for creating Kubernetes clusters on AWS, Azure and GCP with the permissions necessary for deploying Portworx with clouddrives, storage that Portworx automatically provisions. Refer to these links for the instructions for deploying a Kubernetes cluster to each respective cloud provider:

## Deployment Instructions

1. The machine used to deploy a Terraform configuration from requires the installation of the following components:

- [Git command line tool](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Terraform](https://www.terraform.io/downloads)

2. Once both Git and Terraform are installed, clone this repository:
```
git clone https://github.com/chrisadkin/PX-Terraform.git
```

3. Change directory to either EKS, AKS or GKE - depending on which cloud you wish to deploy Kubernetes to, click on the relevant link(s) below for
   instructions for deploying Kubernetes to a specific cloud provider:

- [AWS   - EKS](https://github.com/chrisadkin/PX-Terraform/blob/main/EKS/README.md)
- [Azure - AKS](https://github.com/chrisadkin/PX-Terraform/blob/main/AKS/README.md)
- [GCP   - GKE](https://github.com/chrisadkin/PX-Terraform/blob/main/GKE/README.md)
