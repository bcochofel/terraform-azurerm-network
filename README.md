# terraform-azurerm-network

Terraform AzureRM module for Networking

This module creates a Resource Group with Virtual Network and subnets.

## Usage

```hcl:examples/basic/main.tf
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| azurerm | >= 2.41.0 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| rg | bcochofel/resource-group/azurerm | ~> 1.4.0 |
| vnet | bcochofel/virtual-network/azurerm | ~> 1.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_space | The address space that is used the virtual network.<br>You can supply more than one address space. | `list(string)` | n/a | yes |
| create\_ddos\_pp | Whether or not to create DDoS protection plan. | `bool` | `false` | no |
| ddos\_pp\_name | DDos protection plan name of an existing plan or to create a new one.<br>If create\_ddos\_pp is false and enable\_ddos\_pp is true this variable<br>must reference a DDoS protection plan already created and<br>ddos\_pp\_resource\_group\_name must also be defined. | `string` | `""` | no |
| ddos\_pp\_resource\_group\_name | Resource Group name if using existing DDoS protection plan. | `string` | `""` | no |
| dns\_servers | List of IP addresses of DNS servers. | `list(string)` | `[]` | no |
| enable\_ddos\_pp | Whether or not to enable DDoS protection plan.<br>DDoS can be enabled by creating a new plan or use one that already exists. | `bool` | `false` | no |
| location | The Azure Region where the Resources should exist. | `string` | n/a | yes |
| lock\_level | Specifies the Level to be used for the RG Lock.<br>Possible values are Empty (no lock), CanNotDelete and ReadOnly. | `string` | `""` | no |
| resource\_group\_name | The Name which should be used for this Resource Group. | `string` | n/a | yes |
| tags | A mapping of tags which should be assigned to the Resource Group. | `map(string)` | `{}` | no |
| virtual\_network\_name | The name of the virtual network. | `string` | n/a | yes |
| vm\_protection\_enabled | Whether to enable VM protection for all the subnets in this Virtual Network. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| location | Resource Group location. |
| resource\_group\_id | Resource Group id. |
| resource\_group\_name | Resource Group name. |
| virtual\_network\_id | Virtual Network id. |
| virtual\_network\_name | Virtual Network name. |
| vnet\_address\_space | Virtual Network address space. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Run tests

```bash
cd test/
go test -v
```

## pre-commit hooks

This repository uses [pre-commit](https://pre-commit.com/).

To install execute:

```bash
pre-commit install --install-hooks -t commit-msg
```

To run the hooks you need to install:

* [terraform](https://github.com/hashicorp/terraform)
* [terraform-docs](https://github.com/terraform-docs/terraform-docs)
* [TFLint](https://github.com/terraform-linters/tflint)
* [TFSec](https://github.com/tfsec/tfsec)
* [checkov](https://github.com/bridgecrewio/checkov)

## References
