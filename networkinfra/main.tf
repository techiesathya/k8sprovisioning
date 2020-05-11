# Providers
provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  version         = "=1.44.0"
}

provider "azuread" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  version         = "~>0.3"

}

module "rg" {
  source   = "./../modules/rg/"
  name     = format("sg-rg-%s-nwinfra", var.stage)
  location = var.primary_location
  tags     = local.default_tags
}

module "infravnet" {
  source              = "./../modules/network/vnet"
  name                = format("sg-%s-vnet", var.stage)
  location            = var.primary_location
  resource_group_name = module.rg.resource_group_name
  address_space       = ["10.0.0.0/16"]
  tags                = local.default_tags

}

module "infra_subnet" {
  source              = "./../modules/network/subnet"
  name                = "GatewaySubnet"
  resource_group_name = module.rg.resource_group_name
  vnet_name           = module.infravnet.name
  address_prefix      = "10.0.1.0/24"
}

module "virtualgateway_public_ip" {
  source              = "./../modules/network/publicip"
  public_ip_name      = format("sg-%s-gwpublicip", var.stage)
  allocation_method   = "Dynamic"
  resource_group_name = module.rg.resource_group_name
  location            = var.primary_location
  tags                = local.default_tags
}

module "virtual_network_gateway" {
  source               = "./../modules/network/virtualnetworkgateway"
  name                 = format("sg-%s-vpngateway", var.stage)
  location             = var.primary_location
  resource_group_name  = module.rg.resource_group_name
  gateway_public_ip_id = module.virtualgateway_public_ip.service_principal
  subnet_id            = module.infra_subnet.id
  address_space        = ["10.2.0.0/24"]
  gw_public_cert_data  = var.gw_public_cert_data
}
