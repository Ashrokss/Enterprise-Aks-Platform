output "storage_account_id" {
  value       = azurerm_storage_account.storage_account.id
  description = "The resource ID of the storage account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage_account.name
  description = "The name of the storage account"
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
  description = "The endpoint URL for blob storage in the primary location"
}
