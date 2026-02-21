module "zone" {
  source = "../cloudflare-zone"

  zone_name = var.zone_name
  plan      = var.plan
}

module "zone_settings" {
  source = "../cloudflare-zone-settings"

  zone_id                             = module.zone.zone_id
  ssl                                 = var.ssl
  always_use_https                    = var.always_use_https
  automatic_https_rewrites            = var.automatic_https_rewrites
  min_tls_version                     = var.min_tls_version
  opportunistic_encryption            = var.opportunistic_encryption
  tls_1_3                             = var.tls_1_3
  security_level                      = var.security_level
  browser_check                       = var.browser_check
  challenge_ttl                       = var.challenge_ttl
  privacy_pass                        = var.privacy_pass
  security_header_enabled             = var.security_header_enabled
  security_header_max_age             = var.security_header_max_age
  security_header_include_subdomains  = var.security_header_include_subdomains
  security_header_nosniff             = var.security_header_nosniff
}

module "dns_records" {
  source = "../cloudflare-dns-records"

  zone_id = module.zone.zone_id
  records = var.dns_records
}

module "page_rules" {
  source = "../cloudflare-page-rules"

  zone_id    = module.zone.zone_id
  page_rules = var.page_rules
}
