provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias   = "azure_rm"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

data "azurerm_subscription" "primary" {
  provider        = azurerm
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "default" {
  name     = var.resource_group
  location = var.region 

  tags = {
    environment = var.tag
  }
}

resource "azurerm_kubernetes_cluster" "px_cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.cluster_name}-k8s"

  default_node_pool {
    name            = var.node_pool
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = 128
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret 
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Demo"
  }
}

resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${var.resource_group} --name ${var.cluster_name} --overwrite-existing"
  }

  depends_on = [ azurerm_kubernetes_cluster.px_cluster ]
}

resource "null_resource" "px_azure_secret" {
  provisioner "local-exec" {
    command = <<EOF
      kubectl create ns $NS
      kubectl create secret generic -n $NS px-azure --from-literal=AZURE_TENANT_ID=$TI --from-literal=AZURE_CLIENT_ID=$CI --from-literal=AZURE_CLIENT_SECRET=$CS
    EOF

    environment = {
      TI = var.tenant_id
      CI = var.client_id
      CS = var.client_secret
      NS = var.namespace
    }
  }

  depends_on = [ null_resource.kubeconfig ] 
}
