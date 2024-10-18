module "vnet" {
  source              = "../"
  vnet = {
    name = "testingVnet"
  }
  resource_group_name = "rg-contractualwork"
  location            = "East US"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
  tags = {
    environment = "dev"
  }
  bgp_community           = "12076:20000" # Adjust to a valid range
#   edge_zone               = "eastus1"
  flow_timeout_in_minutes = 30
  encryption = [
    {
      enforcement = "AllowUnencrypted"
    }
  ]
  ddos_protection_plan = []

  subnet = [
    {
      name           = "subnet1"
      address_prefix = "10.0.1.0/24"
    }
  ]
}