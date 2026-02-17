output "zone_id" {
  description = "The Cloudflare zone ID"
  value       = module.zone.zone_id
}

output "name_servers" {
  description = "Cloudflare name servers for the zone"
  value       = module.zone.name_servers
}
