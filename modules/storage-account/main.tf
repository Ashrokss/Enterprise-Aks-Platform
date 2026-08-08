resource "azurerm_storage_account" "storage_account" {
  for_each                 = toset(var.storage_account_name)
  name                     = each.value  
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
