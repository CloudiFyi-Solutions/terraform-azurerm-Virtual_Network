## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Address space for the virtual network | `list(string)` | n/a | yes |
| <a name="input_bgp_community"></a> [bgp\_community](#input\_bgp\_community) | BGP community for the virtual network | `string` | n/a | yes |
| <a name="input_ddos_protection_plan"></a> [ddos\_protection\_plan](#input\_ddos\_protection\_plan) | DDoS protection plan for the virtual network | <pre>list(object({<br/>    id     = string<br/>    enable = bool<br/>  }))</pre> | `[]` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS servers for the virtual network | `list(string)` | n/a | yes |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | Edge zone for the virtual network | `string` | `null` | no |
| <a name="input_encryption"></a> [encryption](#input\_encryption) | Encryption enforcement for the virtual network | <pre>list(object({<br/>    enforcement = string<br/>  }))</pre> | n/a | yes |
| <a name="input_flow_timeout_in_minutes"></a> [flow\_timeout\_in\_minutes](#input\_flow\_timeout\_in\_minutes) | Flow timeout in minutes for the virtual network | `number` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the virtual network | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where the virtual network will be created | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | number of subnet configurations | <pre>list(object({<br/>    name           = string<br/>    address_prefix = string<br/>    service_endpoints      = optional(list(string))<br/>    network_security_group = optional(list(string))<br/>    delegation = optional(list(object({<br/>      name         = string<br/>      service_name = string<br/>      actions      = optional(list(string))<br/>    })))<br/>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the virtual network | `map(string)` | n/a | yes |
| <a name="input_vnet"></a> [vnet](#input\_vnet) | n/a | <pre>object({<br/>    name = string<br/>  })</pre> | n/a | yes |

## Outputs

No outputs.
