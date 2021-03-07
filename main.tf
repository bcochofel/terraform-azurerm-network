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
