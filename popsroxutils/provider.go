package popsroxutils

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Provider -
func Provider() *schema.Provider {
	return &schema.Provider{
		Schema: map[string]*schema.Schema{},
		
		ResourcesMap: map[string]*schema.Resource{
			"popsrox_resource_name": resourceName(),
		},
		DataSourcesMap: map[string]*schema.Resource{
			"popsrox_environment_variable": dataEnvironmentVariable(),
			"popsrox_resource_name":        dataName(),
		},
	}
}
