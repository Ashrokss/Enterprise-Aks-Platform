output "key_vault_id" {
  value       = azurerm_key_vault.key_vault.id
  description = "The resource ID of the Key Vault"
}

output "key_vault_name" {
  value       = azurerm_key_vault.key_vault.name
  description = "The name of the Key Vault"
}

output "key_vault_uri" {
  value       = azurerm_key_vault.key_vault.vault_uri
  description = "The URI of the Key Vault, used by clients to read secrets"
}
