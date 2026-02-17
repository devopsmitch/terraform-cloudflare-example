variable "zone_id" {
  description = "The zone ID"
  type        = string
}

variable "ssl" {
  description = "SSL setting"
  type        = string
  default     = "flexible"
  validation {
    condition     = contains(["off", "flexible", "full", "strict"], var.ssl)
    error_message = "SSL must be one of: off, flexible, full, strict"
  }
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
  description = "Minimum TLS version"
  type        = string
  default     = "1.2"
  validation {
    condition     = contains(["1.0", "1.1", "1.2", "1.3"], var.min_tls_version)
    error_message = "TLS version must be one of: 1.0, 1.1, 1.2, 1.3"
  }
}
