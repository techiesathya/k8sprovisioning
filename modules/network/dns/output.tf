output "dns_config" {
  value = azurerm_dns_zone.dns_zone.name_servers
}
