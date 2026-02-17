locals {
  common_zone_settings = {
    ssl                      = "flexible"
    always_use_https         = true
    automatic_https_rewrites = true
    min_tls_version          = "1.2"
  }

  common_dns_records = {
    mx = {
      name     = "@"
      type     = "MX"
      value    = "mail.example.com"
      ttl      = 3600
      proxied  = false
      priority = 10
    }
    spf = {
      name    = "@"
      type    = "TXT"
      value   = "\"v=spf1 include:_spf.example.com ~all\""
      ttl     = 3600
      proxied = false
    }
  }
}
