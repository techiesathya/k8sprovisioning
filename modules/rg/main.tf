# Generic module for creating resource group
resource "azurerm_resource_group" "k8s_rg" {
  name     = var.name
  location = var.location

  tags = var.tags

}
