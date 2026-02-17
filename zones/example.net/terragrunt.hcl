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
  }
}

inputs = merge(
  local.common.locals.common_zone_settings,
  {
    zone_name   = "example.net"
    dns_records = merge(local.common.locals.common_dns_records, local.zone_specific_records)
    page_rules = {
      redirect_to_main = {
        target   = "*example.net/*"
        priority = 1
        status   = "active"
        actions = {
          forwarding_url = {
            url         = "https://example.com/$2"
            status_code = 301
          }
        }
      }
    }
  }
)
