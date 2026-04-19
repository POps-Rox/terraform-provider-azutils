terraform {
  required_providers {
    popsrox-utils = {
      source = "POps-Rox/popsrox-utils"
    }
  }
}

#Storage account test
resource "popsrox_utils_resource_name" "classic_st" {
  provider      = popsrox-utils
  name          = "log2"
  resource_type = "azurerm_storage_account"
}

output "caf_name_classic_st" {
  value       = popsrox_utils_resource_name.classic_st.result
  description = "Random result based on the resource type"
}

resource "popsrox_utils_resource_name" "azurerm_cognitive_account" {
  provider      = popsrox-utils
  name          = "cogsdemo"
  resource_type = "azurerm_cognitive_account"
  prefixes      = ["a", "z"]
  suffixes      = ["prod"]
  random_length = 5
  random_seed   = 12343
  clean_input   = true
  separator     = "-"
}

output "azurerm_cognitive_account" {
  value       = popsrox_utils_resource_name.azurerm_cognitive_account.result
  description = "Random result based on the resource type"
}

resource "popsrox_utils_resource_name" "multiple_resources" {
  provider       = popsrox-utils
  name           = "cogsdemo2"
  resource_type  = "azurerm_cognitive_account"
  resource_types = ["azurerm_storage_account"]
  prefixes       = ["a", "b"]
  suffixes       = ["prod"]
  random_length  = 4
  random_seed    = 12343
  clean_input    = true
  separator      = "-"
}

output "multiple_resources" {
  value = popsrox_utils_resource_name.multiple_resources.results
}

output "multiple_resources_main" {
  value = popsrox_utils_resource_name.multiple_resources.result
}