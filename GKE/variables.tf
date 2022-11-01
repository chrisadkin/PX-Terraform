variable "project_id" {
  description = "project id"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "region" {
  default     = "europe-west2"
  description = "GCP region to deploy GKE cluster to"
}

variable "cluster_name" { }

variable "gke_num_nodes" {
  default     = 1 
  description = "number of gke nodes"
}

variable "machine_type" {
  default     = "e2-standard-8" 
  description = "Machine type for Kubernetes node pool"
}

variable "kubernetes_version" {
  default     = "1.22.12-gke.2300"
}
