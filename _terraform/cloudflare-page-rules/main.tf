resource "cloudflare_page_rule" "this" {
  for_each = var.page_rules

  zone_id  = var.zone_id
  target   = each.value.target
  priority = each.value.priority
  status   = each.value.status

  actions {
    cache_level = try(each.value.actions.cache_level, null)

    dynamic "forwarding_url" {
      for_each = try([each.value.actions.forwarding_url], [])
      content {
        url         = forwarding_url.value.url
        status_code = forwarding_url.value.status_code
      }
    }
  }
}
