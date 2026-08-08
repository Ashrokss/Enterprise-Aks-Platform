output "storage_account_id" {
  value       = module.storage_account.storage_account_id
  description = "The resource ID of the storage account"
}

output "storage_account_name" {
  value       = module.storage_account.storage_account_name
  description = "The name of the storage account"
}
