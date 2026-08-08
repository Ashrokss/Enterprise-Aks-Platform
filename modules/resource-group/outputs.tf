output "resource_group_id" {
  value       = azurerm_resource_group.rg.id
  description = "The resource ID of the resource group"
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group"
}

output "resource_group_location" {
  value       = azurerm_resource_group.rg.location
  description = "The location of the resource group"
}
