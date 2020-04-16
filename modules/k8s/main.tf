
resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = format("%s-dns", var.name)

  default_node_pool {
    availability_zones    = var.availability_zones
    enable_auto_scaling   = var.enable_auto_scaling
    enable_node_public_ip = var.enable_node_public_ip
    max_pods              = var.max_pods
    name                  = var.node_poolname
    node_count            = var.node_count
    node_taints           = var.node_taints
    os_disk_size_gb       = var.os_disk_size
    type                  = "AvailabilitySet"
    vm_size               = var.vm_size
  }
  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }

  tags = var.tags

  depends_on = [var.service_principle_dependancy]
}
