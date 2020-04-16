
output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "service_principal" {
  value = azurerm_public_ip.public_ip.id
}
