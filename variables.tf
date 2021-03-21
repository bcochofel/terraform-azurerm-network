variable "location" {
  description = <<EOT
The Azure Region where the Resources should exist.
EOT
  type        = string
}

variable "resource_group_name" {
  description = <<EOT
The Name which should be used for this Resource Group.
EOT
  type        = string
}

variable "lock_level" {
  description = <<EOT
Specifies the Level to be used for the RG Lock.
Possible values are Empty (no lock), CanNotDelete and ReadOnly.
EOT
  type        = string
  default     = ""
}

variable "virtual_network_name" {
  description = <<EOT
The name of the virtual network.
EOT
  type        = string
}

variable "address_space" {
  description = <<EOT
The address space that is used the virtual network.
You can supply more than one address space.
EOT
  type        = list(string)
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers."
  type        = list(string)
  default     = []
}

variable "vm_protection_enabled" {
  description = "Whether to enable VM protection for all the subnets in this Virtual Network."
  type        = bool
  default     = false
}

variable "enable_ddos_pp" {
  description = <<EOT
Whether or not to enable DDoS protection plan.
DDoS can be enabled by creating a new plan or use one that already exists.
EOT
  type        = bool
  default     = false
}

variable "create_ddos_pp" {
  description = "Whether or not to create DDoS protection plan."
  type        = bool
  default     = false
}

variable "ddos_pp_name" {
  description = <<EOT
DDos protection plan name of an existing plan or to create a new one.
If create_ddos_pp is false and enable_ddos_pp is true this variable
must reference a DDoS protection plan already created and
ddos_pp_resource_group_name must also be defined.
EOT
  type        = string
  default     = ""
}

variable "ddos_pp_resource_group_name" {
  description = "Resource Group name if using existing DDoS protection plan."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Resources."
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = <<EOT
List of subnets object.

The subnet object can have the following fields:
* name (required)
* address_prefixes (required)
* enforce_private_link_endpoint_network_policies (opcional)
* enforce_private_link_service_network_policies (opcional)
* service_endpoints (opcional)
* service_endpoint_policy_ids (opcional)

Example:

```hcl
subnets = [
  {
    name = "subnet1"
    address_prefixes = "10.0.0.0/24"
  },
  {
    name = "subnet2"
    address_prefixes = "10.0.1.0/24"
    tags = {
      "Environment" = "development"
    }
  }
]
```
EOT
  type        = any
  default     = []
}

variable "enforce_private_link_endpoint_network_policies" {
  description = <<EOT
Enable or Disable network policies for the private link endpoint on the subnet.
Conflicts with enforce_private_link_service_network_policies.
EOT
  type        = bool
  default     = false
}

variable "enforce_private_link_service_network_policies" {
  description = <<EOT
Enable or Disable network policies for the private link service on the subnet.
Conflicts with enforce_private_link_endpoint_network_policies.
EOT
  type        = bool
  default     = false
}

variable "service_endpoints" {
  description = <<EOT
The list of Service endpoints to associate with the subnet.
Possible values include:
* Microsoft.AzureActiveDirectory
* Microsoft.AzureCosmosDB
* Microsoft.ContainerRegistry
* Microsoft.EventHub
* Microsoft.KeyVault
* Microsoft.ServiceBus
* Microsoft.Sql
* Microsoft.Storage
* Microsoft.Web
EOT
  type        = list(string)
  default     = []
}

variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = list(string)
  default     = null
}
