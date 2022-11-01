module "service_principal" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  source = "./modules/service_principal"
}

module "aks_cluster" {
  subscription_id = var.subscription_id
  resource_group  = var.resource_group
  region          = var.region
  tag             = var.tag
  cluster_name    = var.cluster_name
  node_pool       = var.node_pool
  node_count      = var.node_count
  vm_size         = var.vm_size
  client_id       = module.service_principal.client_id
  client_secret   = module.service_principal.client_secret
  tenant_id       = module.service_principal.tenant_id  
  principal_id    = module.service_principal.principal_id
  namespace       = var.namespace
  source = "./modules/aks_cluster"
}
