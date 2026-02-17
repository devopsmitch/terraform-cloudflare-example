variable "zone_id" {
  description = "The zone ID"
  type        = string
}

variable "records" {
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
