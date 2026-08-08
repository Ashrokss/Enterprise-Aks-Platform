output "client_id" {
  value       = azuread_application.app.client_id
  description = "The client ID (application ID) of the service principal"
}

output "client_secret" {
  value       = azuread_service_principal_password.sp.value
  description = "The generated client secret of the service principal"
  sensitive   = true
}

output "service_principal_object_id" {
  value       = azuread_service_principal.sp.object_id
  description = "The object ID of the service principal, used for role assignments"
}

output "service_principal_tenant_id" {
  value       = data.azuread_client_config.current.tenant_id
  description = "The tenant ID the service principal belongs to"
}
