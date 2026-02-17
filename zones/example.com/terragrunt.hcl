include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../_terraform/zone"
}

locals {
  common = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  zone_specific_records = {
    root = {
      name    = "@"
      type    = "A"
      value   = "192.0.2.1"
      proxied = true
    }
    www = {
      name    = "www"
      type    = "CNAME"
      value   = "example.com"
      proxied = true
    }
  }
}

inputs = merge(
  local.common.locals.common_zone_settings,
  {
    zone_name   = "example.com"
    dns_records = merge(local.common.locals.common_dns_records, local.zone_specific_records)
    page_rules  = {}
  }
)
