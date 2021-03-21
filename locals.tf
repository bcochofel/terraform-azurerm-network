locals {
  subnets = {
    for s in var.subnets :
    s.name => {
      name                                           = s.name
      address_prefixes                               = s.address_prefixes
      enforce_private_link_endpoint_network_policies = lookup(s, "enforce_private_link_endpoint_network_policies", null) == null ? var.enforce_private_link_endpoint_network_policies : s.enforce_private_link_endpoint_network_policies
      enforce_private_link_service_network_policies  = lookup(s, "enforce_private_link_service_network_policies", null) == null ? var.enforce_private_link_service_network_policies : s.enforce_private_link_service_network_policies
      service_endpoints                              = lookup(s, "service_endpoints", null) == null ? var.service_endpoints : s.service_endpoints
      service_endpoint_policy_ids                    = lookup(s, "service_endpoint_policy_ids", null) == null ? var.service_endpoint_policy_ids : s.service_endpoint_policy_ids
    }
  }
}
