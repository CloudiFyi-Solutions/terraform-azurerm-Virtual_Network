resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags

  bgp_community           = var.bgp_community
  # edge_zone               = var.edge_zone
  flow_timeout_in_minutes = var.flow_timeout_in_minutes

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan == null ? [] : var.ddos_protection_plan
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  dynamic "encryption" {
    for_each = var.encryption == null ? [] : var.encryption
    content {
      enforcement = encryption.value.enforcement
    }
  }

  dynamic "subnet" {
    for_each = var.subnet == null ? [] : var.subnet
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}
