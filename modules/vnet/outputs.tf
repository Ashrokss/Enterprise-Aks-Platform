output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The resource ID of the virtual network"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the virtual network"
}

output "vnet_address_space" {
  value       = azurerm_virtual_network.vnet.address_space
  description = "The address spaces of the virtual network"
}