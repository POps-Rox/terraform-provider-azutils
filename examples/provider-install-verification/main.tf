terraform {
  required_providers {
    popsrox_utils = {
      source = "POps-Rox/popsrox-utils"
    }
  }
}

provider "popsrox_utils" {}

#Storage account test
resource "popsrox_utils_resource_name" "azurerm_cognitive_account" {
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
  value       = popsrox_utils_resource_name.azurerm_cognitive_account.result
  description = "Random result based on the resource type"
}
