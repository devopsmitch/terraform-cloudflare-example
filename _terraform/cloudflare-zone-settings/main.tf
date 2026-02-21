resource "cloudflare_zone_settings_override" "this" {
  zone_id = var.zone_id

  settings {
    ssl                      = var.ssl
    always_use_https         = var.always_use_https
    automatic_https_rewrites = var.automatic_https_rewrites
    min_tls_version          = var.min_tls_version
    opportunistic_encryption = var.opportunistic_encryption
    tls_1_3                  = var.tls_1_3
    security_level           = var.security_level
    browser_check            = var.browser_check
    challenge_ttl            = var.challenge_ttl
    privacy_pass             = var.privacy_pass
    security_header {
      enabled            = var.security_header_enabled
      max_age            = var.security_header_max_age
      include_subdomains = var.security_header_include_subdomains
      nosniff            = var.security_header_nosniff
    }
  }
}
