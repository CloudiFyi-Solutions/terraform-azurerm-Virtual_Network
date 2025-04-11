# Fetch the Snowflake Resource Groups dynamically
data "azurerm_resource_group" "snowflake_resource_groups" {
  for_each = toset([
    "az3-snowflake-centralus-prd-rg",
    "az3-snowflake-eastus2-prd-rg",
    "az3-snowflake-centralus-npe-rg",
    "az3-snowflake-eastus2-npe-rg"
  ])
  name = each.key
}

  # 👇 NEW: Pass the Resource Group IDs
  snowflake_resource_group_ids = { for k, v in data.azurerm_resource_group.snowflake_resource_groups : k => v.id }
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
