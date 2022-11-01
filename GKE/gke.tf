resource "google_service_account" "px" {
  account_id   = "px-service-account"
  display_name = "Portworx service account"
}

resource "google_project_iam_binding" "px_service_account_user" {
    project = var.project_id
    role    = "roles/iam.serviceAccountUser"
    members = [
        "serviceAccount:${google_service_account.px.email}",
    ]
}

resource "google_project_iam_binding" "px_account_admin" {
    project = var.project_id
    role    = "roles/compute.admin"
    members = [
        "serviceAccount:${google_service_account.px.email}",
    ]
}

resource "google_project_iam_binding" "px_kubernetes_engine_cluster_viewer" {
    project = var.project_id
    role    = "roles/container.clusterViewer"
    members = [
        "serviceAccount:${google_service_account.px.email}",
    ]
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name 
  location = var.region
  
  remove_default_node_pool = true
  min_master_version       = var.kubernetes_version 
  node_version             = var.kubernetes_version 
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

resource "google_container_node_pool" "primary_nodes" {
  name               = "${google_container_cluster.primary.name}-node-pool"
  location           = var.region
  cluster            = var.cluster_name
  initial_node_count = 1

  node_config {
    image_type   = "UBUNTU_CONTAINERD"
    disk_size_gb = 128 

    labels = {
      env = var.project_id
    }

    machine_type  = var.machine_type 
    service_account = google_service_account.px.email

    tags     = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
