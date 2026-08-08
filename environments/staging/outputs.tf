output "resource_group_name" {
  value       = module.resource_group.resource_group_name
  description = "The name of the resource group holding the staging environment"
}

output "cluster_name" {
  value       = module.aks.cluster_name
  description = "The name of the AKS cluster"
}

output "cluster_fqdn" {
  value       = module.aks.cluster_fqdn
  description = "The FQDN of the cluster's API server"
}

output "key_vault_name" {
  value       = module.key_vault.key_vault_name
  description = "The name of the Key Vault holding the service principal credentials"
}

output "key_vault_uri" {
  value       = module.key_vault.key_vault_uri
  description = "The URI of the Key Vault"
}

# No output for the secret on purpose - read it from the vault.
output "service_principal_client_id" {
  value       = module.service_principal.client_id
  description = "The client ID of the service principal used by AKS"
}
