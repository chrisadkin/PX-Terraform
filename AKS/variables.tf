variable "subscription_id" { }

variable "tenant_id" { }

variable "region" {
  default = "uksouth"
}

variable "cluster_name" {
  default = "KynAksSource"
}

variable "resource_group" {
  default = "Kyndryl_demo"
}

variable "tag" {
  default = "Kyndryl_demo"
}

variable "node_pool" {
  default = "defaultpool"
}

variable "node_count" {
  default = 3
}

variable "vm_size" {
  default = "standard_d8as_v4"
}

variable "namespace" {
  default = "portworx"
}
