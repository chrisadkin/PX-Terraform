resource "azurerm_role_definition" "portworx_cloud_drive" {
  name        = "tf-portworx-cloud-drive"
  scope       = data.azurerm_subscription.primary.id
  description = "Portworx cloud drive role"

  permissions {
    actions     = [ "Microsoft.ContainerService/managedClusters/agentPools/read"
                   ,"Microsoft.Compute/disks/delete"
                   ,"Microsoft.Compute/disks/write"
                   ,"Microsoft.Compute/disks/read"
                   ,"Microsoft.Compute/virtualMachines/write"
                   ,"Microsoft.Compute/virtualMachines/read"
                   ,"Microsoft.Compute/virtualMachineScaleSets/virtualMachines/write"
                   ,"Microsoft.Compute/virtualMachineScaleSets/virtualMachines/read" ]
    not_actions = []
  }

  assignable_scopes = [
    "/subscriptions/${var.subscription_id}/resourceGroups/MC_${var.resource_group}_${var.cluster_name}_uksouth"
  ]

  depends_on = [ azurerm_kubernetes_cluster.px_cluster ]
}

resource "azurerm_role_assignment" "portworx_cloud_drive" {
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/MC_${var.resource_group}_${var.cluster_name}_uksouth"
  role_definition_name = azurerm_role_definition.portworx_cloud_drive.name
  principal_id         = var.principal_id 
  
  depends_on = [ azurerm_role_definition.portworx_cloud_drive ]
}
