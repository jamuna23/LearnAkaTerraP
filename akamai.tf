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
    name    = "non-prod-demo"
    product_id  = "prd_SPM"
    contract_id = var.contractid
    group_id    = var.groupid
    hostnames {                                     # Hostname configuration
      cname_from = "example.com"
      cname_to = "example.com.edgekey.net"
      cert_provisioning_type = "DEFAULT"
    }
    hostnames {
      cname_from = "www.example.com"
      cname_to = "example.com.edgesuite.net"
      cert_provisioning_type = "CPS_MANAGED"
    }
    rule_format = "v2020-03-04"
    rules       = non-prod-preview.v5.default.json
}