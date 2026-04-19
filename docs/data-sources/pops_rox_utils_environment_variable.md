---
page_title: "pops_rox_utils_environment_variable Data Source - terraform-provider-pops-rox-utils"
subcategory: "Utilities"
description: |-
  Reads an environment variable from the Terraform execution environment and exposes it as a data source attribute.
---

# pops_rox_utils_environment_variable (Data Source)

The `pops_rox_utils_environment_variable` data source reads an environment variable from the environment
in which Terraform is running and exposes its value as a computed attribute.

> **⚠️ Security Warning:** All values read by this data source are persisted in Terraform state.
> Ensure you are using an encrypted remote backend (e.g., Azure Blob Storage with encryption at rest)
> when using this data source with sensitive values.

## Example Usage

```hcl
terraform {
  required_providers {
    pops-rox-utils = {
      source  = "pops-rox/pops-rox-utils"
      version = "~> 2.0"
    }
  }
}

data "pops_rox_utils_environment_variable" "arm_subscription_id" {
  name           = "ARM_SUBSCRIPTION_ID"
  fails_if_empty = true
}

output "subscription_id" {
  value     = data.pops_rox_utils_environment_variable.arm_subscription_id.value
  sensitive = true
}
```

## Argument Reference

* **name** - (Required) The name of the environment variable to read.
* **fails_if_empty** - (Optional) Defaults to `false`. When set to `true`, Terraform will return an
  error during plan/apply if the environment variable is not set or is empty. When `false`, an empty
  string is returned without error.

## Attributes Reference

* **id** - The name of the environment variable (same as `name`).
* **value** - The value of the environment variable. This attribute is marked `sensitive` to prevent
  accidental exposure in logs.
