variable "zone_name" {
  description = "The DNS zone name"
  type        = string
}

variable "plan" {
  description = "Cloudflare plan type"
  type        = string
  default     = "free"
}

variable "ssl" {
  description = "SSL setting (off, flexible, full, strict)"
  type        = string
  default     = "flexible"
}

variable "always_use_https" {
  description = "Always use HTTPS"
  type        = bool
  default     = true
}

variable "automatic_https_rewrites" {
  description = "Automatic HTTPS rewrites"
  type        = bool
  default     = true
}

variable "min_tls_version" {
  description = "Minimum TLS version (1.0, 1.1, 1.2, 1.3)"
  type        = string
  default     = "1.2"
}

variable "dns_records" {
  description = "DNS records to create"
  type = map(object({
    name     = string
    type     = string
    value    = string
    ttl      = optional(number, 1)
    proxied  = optional(bool, false)
    priority = optional(number)
  }))
  default = {}
}

variable "page_rules" {
  description = "Page rules to create"
  type = map(object({
    target   = string
    priority = optional(number, 1)
    status   = optional(string, "active")
    actions  = map(any)
  }))
  default = {}
}
