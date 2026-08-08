output "resource_group_names" {
  value = {
    for k, rg in module.resource_group : k => rg.resource_group_name
  }
  description = "Map of resource group names by key"
}

output "resource_group_locations" {
  value = {
    for k, rg in module.resource_group : k => rg.resource_group_location
  }
  description = "Map of resource group locations by key"
}
