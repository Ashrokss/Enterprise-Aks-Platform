output "storage_account_names" {
  value       = module.storage_account.storage_account_name
  description = "Map of storage account names by key"
}

output "storage_account_ids" {
  value       = module.storage_account.storage_account_id
  description = "Map of storage account IDs by key"
}