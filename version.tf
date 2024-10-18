terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  required_version = ">=1.0.0"
}

provider "azurerm" {
  features {}
  subscription_id = "33db2cec-3605-467d-8216-742b23f46591"
}