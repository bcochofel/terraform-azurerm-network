provider "azurerm" {
  features {}
}

module "network" {
  source = "../.."

  location             = "North Europe"
  resource_group_name  = "rg-network-basic-example"
  virtual_network_name = "vnet-network-basic-example"

  address_space = ["10.0.0.0/16"]
}
