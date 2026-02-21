locals {
  common_zone_settings = {
    ssl                                = "strict"
    always_use_https                   = true
    automatic_https_rewrites           = true
    min_tls_version                    = "1.2"
    opportunistic_encryption           = true
    tls_1_3                            = true
    security_level                     = "medium"
    browser_check                      = true
    challenge_ttl                      = 1800
    privacy_pass                       = true
    security_header_enabled            = true
    security_header_max_age            = 31536000
    security_header_include_subdomains = true
    security_header_nosniff            = true
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
