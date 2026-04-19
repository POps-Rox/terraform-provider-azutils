package main

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
	"terraform-provider-popsrox-utils/popsroxutils"
)

//go:generate go run gen.go

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: func() *schema.Provider {
			return popsroxutils.Provider()
		},
	})
}
