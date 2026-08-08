resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name           = "system"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.subnet_id

    # Azure sets this itself, so leaving it out shows up as drift on every plan.
    upgrade_settings {
      max_surge = "10%"
    }
  }

  # AKS uses this to manage load balancers, disks and the node resource group.
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  # Overlay keeps pod IPs off the node subnet, so a /24 is plenty.
  # service_cidr must not overlap the vnet.
  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    service_cidr        = "172.16.0.0/16"
    dns_service_ip      = "172.16.0.10"
  }

  tags = var.tags
}
