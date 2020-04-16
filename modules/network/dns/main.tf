resource "azurerm_dns_zone" "dns_zone" {
  name                = var.domain_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
