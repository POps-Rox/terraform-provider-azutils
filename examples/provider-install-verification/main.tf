terraform {
  required_providers {
    pops-rox-utils = {
      source = "pops-rox/pops-rox-utils"
    }
  }
}

provider "pops-rox-utils" {}

#Storage account test
resource "pops_rox_utils_resource_name" "azurerm_cognitive_account" {
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
  value       = pops_rox_utils_resource_name.azurerm_cognitive_account.result
  description = "Random result based on the resource type"
}
