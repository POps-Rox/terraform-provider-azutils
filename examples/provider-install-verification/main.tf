terraform {
  required_providers {
    popsrox = {
      source = "POps-Rox/azutils"
    }
  }
}

provider "popsrox" {}

resource "popsrox_resource_name" "azurerm_cognitive_account" {
  provider      = popsrox
  name          = "anoacogserviced"
  resource_type = "azurerm_cognitive_account"
  prefixes      = ["anoa", "eastus"]
  suffixes      = ["prod"]
  random_length = 5
  random_seed   = 12343
  use_slug      = true
  clean_input   = true
  separator     = "-"
}

output "azurerm_cognitive_account" {
  value       = popsrox_resource_name.azurerm_cognitive_account.result
  description = "Random result based on the resource type"
}
