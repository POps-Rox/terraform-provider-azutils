## 2.0.0 (Unreleased)

### BREAKING CHANGES

- Provider renamed from `azurenoops/azurenoopsutils` to `pops-rox/pops-rox-utils`
- Go module renamed from `terraform-provider-azurenoopsutils` to `terraform-provider-pops-rox-utils`
- Resource type prefix changed: `azurenoopsutils_*` → `pops_rox_utils_*`
  - `azurenoopsutils_resource_name` → `pops_rox_utils_resource_name`
  - `azurenoopsutils_environment_variable` → `pops_rox_utils_environment_variable`
- Downstream `versions.tf` must be updated to:
  ```hcl
  pops-rox-utils = {
    source  = "pops-rox/pops-rox-utils"
    version = "~> 2.0"
  }
  ```

### BUG FIXES

- Fixed `fails_if_empty` logic in `pops_rox_utils_environment_variable` data source: previously returned an error unconditionally; now correctly only errors when the variable value is empty

### DEPENDENCY UPDATES

- Updated Go from 1.17 to 1.22
- Updated `terraform-plugin-sdk/v2` from v2.10.1 to v2.36.1
- Updated `terraform-plugin-docs` from v0.13.0 to v0.21.0

## 0.1.0 (Unreleased)

BACKWARDS INCOMPATIBILITIES / NOTES:
