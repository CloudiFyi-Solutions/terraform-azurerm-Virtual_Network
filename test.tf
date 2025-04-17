  snowflake_dns_zones = {
    npe = {
      centralus-npe = {
        name           = "privatelink.snowflake.app"
        resource_group = "az3-snowflake-centralus-npe-rg"
      },
      eastus2-npe = {
        name           = "privatelink.snowflake.app"
        resource_group = "az3-snowflake-eastus2-npe-rg"
      }
    },
    prd = {
      centralus-prd = {
        name           = "privatelink.snowflake.app"
        resource_group = "az3-snowflake-centralus-prd-rg"
      },
      eastus2-prd = {
        name           = "privatelink.snowflake.app"
        resource_group = "az3-snowflake-eastus2-prd-rg"
      }
    }
  }

  selected_dns_zones = local.snowflake_dns_zones[var.environment]
}

data "azurerm_private_dns_zone" "snowflake_dns_zones" {
  for_each = local.selected_dns_zones

  name                = each.value.name
  resource_group_name = each.value.resource_group
}
private_dns_zone_ids = {
  for k, v in data.azurerm_private_dns_zone.snowflake_dns_zones : k => v.id
}

# Assign "Private DNS Zone Contributor" role to SPNs at Snowflake Resource Group level
resource "azurerm_role_assignment" "snowflake_spn_private_dns_contributor" {
  for_each             = var.snowflake_resource_group_ids
  scope                = each.value
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = data.azurerm_service_principal.ss-sp.object_id
}

variable "snowflake_resource_group_ids" {
  description = "Snowflake Resource Group IDs for assigning Private DNS Zone Contributor Role"
  type        = map(string)
  default     = {}
}
