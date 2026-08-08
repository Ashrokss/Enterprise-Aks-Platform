output "rg_name" {
  value = azurerm_resource_group.rg.name
  description = "The name of the resource group"
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
  description = "The location of the resource group"
}