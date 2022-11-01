data "azuread_client_config" "aks_px" {}

provider "azurerm" {
  features {}
  alias   = "azure_rm"
}

data "azurerm_subscription" "primary" {
  provider        = azurerm.azure_rm
  subscription_id = var.subscription_id
}

resource "azuread_application" "aks_px" {
  display_name = "AKS_PX"
  owners       = [data.azuread_client_config.aks_px.object_id]
}

resource "azuread_service_principal" "aks_px" {
  application_id               = azuread_application.aks_px.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.aks_px.object_id]

  feature_tags {
    enterprise = true
    gallery    = true
  }
}

resource "azuread_service_principal_password" "aks_px" {
  service_principal_id = "${azuread_service_principal.aks_px.id}"
  end_date             = "2050-01-01T01:02:03Z" 
}

output "tenant_id" {
  value = data.azurerm_subscription.primary.tenant_id
  description = "Tenant id"
}

output "principal_id" {
  value       = azuread_service_principal.aks_px.id
  description = "Principal id"
}

output "client_id" {
  value       = azuread_application.aks_px.application_id
  description = "Client ID"
}

output "client_secret" {
  value       = azuread_service_principal_password.aks_px.value
  description = "Client secret"
}
