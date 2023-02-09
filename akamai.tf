terraform {
  required_providers {
    akamai = {
      source = "akamai/akamai"
      version = "3.2.1"
    }
  }
}

# Configure the Akamai Provider
provider "akamai" {




  }



resource "akamai_property" "example" {
    name = "test-dt3-ux-menumanager"                        # Property Name
    product_id  = "prd_SPM"                         # Product Identifier (Ion)
    group_id    = "grp_62484"      # Group ID variable
    contract_id = "ctr_C-1D5HYBF"     # Contract ID variable
    hostnames {                                   # Hostname configuration
      cname_from             = "dt3-ux-menumanager.test.subway.com"
      cname_to               = "wild.test.subway.com.edgekey.net"
      cert_provisioning_type = "CPS_MANAGED"
        }

    rule_format = "latest"                           # Rule Format
    rules       = file("${path.module}/rules.json")       # JSON Rule tree
}
