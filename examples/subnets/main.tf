provider "azurerm" {
  features {}
}

module "network" {
  source = "../.."

  location             = "North Europe"
  resource_group_name  = "rg-network-basic-example"
  virtual_network_name = "vnet-network-basic-example"

  address_space = ["10.0.0.0/16"]

  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.0.0.0/24"]
    },
    {
      name             = "subnet2"
      address_prefixes = ["10.0.1.0/24"]
    }
  ]

  tags = {
    "ManagedBy" = "Terraform"
  }
}
