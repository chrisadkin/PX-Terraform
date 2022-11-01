variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "ec2_instance_type" {
  type        = string
  default     = "c4.2xlarge"
}

variable "cluster_name" {
  type        = string
  default     = "portworx"
}
