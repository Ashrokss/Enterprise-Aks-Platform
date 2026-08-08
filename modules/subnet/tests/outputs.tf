output "subnet_id" {
  value       = module.subnet.subnet_id
  description = "The resource ID of the subnet"
}

output "subnet_name" {
  value       = module.subnet.subnet_name
  description = "The name of the subnet"
}