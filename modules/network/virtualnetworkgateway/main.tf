resource "azurerm_virtual_network_gateway" "virtual_gateway" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = false
  sku                 = "Standard"
  //connection_protocol = ["OpenVPN", "IkeV2"]
  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = var.gateway_public_ip_id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnet_id
  }
  vpn_client_configuration {
    address_space = var.address_space
    root_certificate {
      name             = "Root-Cert"
      public_cert_data = var.gw_public_cert_data
    }
  }
}
