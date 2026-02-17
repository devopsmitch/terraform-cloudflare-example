resource "cloudflare_record" "this" {
  for_each = var.records

  zone_id  = var.zone_id
  name     = each.value.name
  type     = each.value.type
  value    = each.value.value
  ttl      = each.value.ttl
  proxied  = each.value.proxied
  priority = each.value.priority
}
