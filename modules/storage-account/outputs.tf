output "storage_account_name" {
  value = { for k, sa in azurerm_storage_account.storage_account : k => sa.name }
}

output "storage_account_id" {
  value = { for k, sa in azurerm_storage_account.storage_account : k => sa.id }
}