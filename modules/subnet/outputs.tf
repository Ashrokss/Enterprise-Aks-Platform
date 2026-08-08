output "subnet_id" {
  value       = azurerm_subnet.subnet.id
  description = "The resource ID of the subnet"
}

output "subnet_name" {
  value       = azurerm_subnet.subnet.name
  description = "The name of the subnet"
}