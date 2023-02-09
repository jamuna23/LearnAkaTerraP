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

config{
client_secret = "J/AZO9hXUlUOU4d5pM9Lc+lS8sgMcaB0s9o7eYgk7+o=" 
host = "akab-75dlnrw66zwvyvk5-ulxoodt7x6hdibda.luna.akamaiapis.net" 
access_token = "akab-3avxndlqgz7poyhm-3nfaunyxt4b5ex4e" 
client_token = "akab-wuuor5zdra2hjm5s-iaqo6p3tc4phwq6s" 
}


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
