output "location" {
  description = "Resource Group location."
  value       = module.rg.location
}

output "resource_group_name" {
  description = "Resource Group name."
  value       = module.rg.name
}

output "resource_group_id" {
  description = "Resource Group id."
  value       = module.rg.id
}

output "virtual_network_name" {
  description = "Virtual Network name."
  value       = module.vnet.name
}

output "virtual_network_id" {
  description = "Virtual Network id."
  value       = module.vnet.id
}

output "vnet_address_space" {
  description = "Virtual Network address space."
  value       = module.vnet.address_space
}
