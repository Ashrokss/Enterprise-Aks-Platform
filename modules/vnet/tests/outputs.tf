output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "The resource ID of the virtual network"
}

output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "The name of the virtual network"
}