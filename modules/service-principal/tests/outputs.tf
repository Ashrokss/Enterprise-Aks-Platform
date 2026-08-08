output "client_id" {
  value       = module.service_principal.client_id
  description = "The client ID of the service principal"
}

output "service_principal_object_id" {
  value       = module.service_principal.service_principal_object_id
  description = "The object ID of the service principal"
}

output "service_principal_tenant_id" {
  value       = module.service_principal.service_principal_tenant_id
  description = "The tenant ID the service principal belongs to"
}
