# Fetch the Snowflake Private DNS Zones dynamically
data "azurerm_private_dns_zone" "snowflake_dns_zones" {
  for_each = toset([
    "privatelink.snowflake.app|az3-snowflake-centralus-prd-rg",
    "privatelink.snowflake.app|az3-snowflake-eastus2-prd-rg",
    "privatelink.snowflake.app|az3-snowflake-centralus-npe-rg",
    "privatelink.snowflake.app|az3-snowflake-eastus2-npe-rg"
  ])
  name                = split("|", each.key)[0]
  resource_group_name = split("|", each.key)[1]
}

# 👇 ADD THIS OUTPUT
output "snowflake_private_dns_zone_ids" {
  value = { for k, v in data.azurerm_private_dns_zone.snowflake_dns_zones : k => v.id }
}

# Assign Contributor Role to Snowflake SPN for all Private DNS Zones
resource "azurerm_role_assignment" "snowflake_spn_dns_contributor" {
  for_each             = var.private_dns_zone_ids
  scope                = each.value
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_service_principal.ss-sp.object_id
}


private_dns_zone_ids = output.snowflake_private_dns_zone_ids

variable "private_dns_zone_ids" {
  description = "Private DNS Zone IDs for Snowflake"
  type        = map(string)
  default     = {}
}
