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

variable "opportunistic_encryption" {
  description = "Opportunistic encryption"
  type        = bool
  default     = true
}

variable "tls_1_3" {
  description = "TLS 1.3"
  type        = bool
  default     = true
}

variable "security_level" {
  description = "Security level"
  type        = string
  default     = "medium"
  validation {
    condition     = contains(["off", "essentially_off", "low", "medium", "high", "under_attack"], var.security_level)
    error_message = "Security level must be one of: off, essentially_off, low, medium, high, under_attack"
  }
}

variable "browser_check" {
  description = "Browser integrity check"
  type        = bool
  default     = true
}

variable "challenge_ttl" {
  description = "Challenge TTL in seconds"
  type        = number
  default     = 1800
}

variable "privacy_pass" {
  description = "Privacy Pass support"
  type        = bool
  default     = true
}

variable "security_header_enabled" {
  description = "Enable HSTS security header"
  type        = bool
  default     = true
}

variable "security_header_max_age" {
  description = "HSTS max age in seconds"
  type        = number
  default     = 31536000
}

variable "security_header_include_subdomains" {
  description = "Include subdomains in HSTS"
  type        = bool
  default     = true
}

variable "security_header_nosniff" {
  description = "Enable X-Content-Type-Options: nosniff"
  type        = bool
  default     = true
}
