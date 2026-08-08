# Tenant of whoever is running Terraform.
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name

  # RBAC instead of the older access policy model.
  rbac_authorization_enabled = var.rbac_authorization_enabled

  # Soft delete is always on. Purge protection stays off so destroy actually cleans up.
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  tags = var.tags
}
