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

# Assign Contributor Role to Snowflake SPN for all DNS Zones
resource "azurerm_role_assignment" "snowflake_spn_dns_contributor" {
  for_each             = data.azurerm_private_dns_zone.snowflake_dns_zones
  scope                = each.value.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_service_principal.ss-sp.object_id
}
