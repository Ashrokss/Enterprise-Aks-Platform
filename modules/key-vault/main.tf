# Used to look up the tenant Terraform is authenticated against.
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name

  # RBAC is the current way to control who can read secrets.
  rbac_authorization_enabled = var.rbac_authorization_enabled

  # Soft delete cannot be turned off. Purge protection is left off so the vault
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  tags = var.tags
}
