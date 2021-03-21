module "rg" {
  source  = "bcochofel/resource-group/azurerm"
  version = "~> 1.4.0"

  name       = var.resource_group_name
  location   = var.location
  lock_level = var.lock_level

  tags = var.tags
}

module "vnet" {
  source  = "bcochofel/virtual-network/azurerm"
  version = "~> 1.2.0"

  resource_group_name   = module.rg.name
  name                  = var.virtual_network_name
  address_space         = var.address_space
  dns_servers           = var.dns_servers
  vm_protection_enabled = var.vm_protection_enabled

  enable_ddos_pp              = var.enable_ddos_pp
  create_ddos_pp              = var.create_ddos_pp
  ddos_pp_name                = var.ddos_pp_name
  ddos_pp_resource_group_name = var.ddos_pp_resource_group_name

  tags = var.tags

  depends_on = [module.rg]
}



module "subnet" {
  source  = "bcochofel/subnet/azurerm"
  version = "1.3.1"

  for_each = local.subnets

  name                                           = each.value.name
  address_prefixes                               = each.value.address_prefixes
  enforce_private_link_endpoint_network_policies = each.value.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = each.value.enforce_private_link_service_network_policies
  service_endpoints                              = each.value.service_endpoints
  service_endpoint_policy_ids                    = each.value.service_endpoint_policy_ids

  resource_group_name  = module.rg.name
  virtual_network_name = module.vnet.name
}
