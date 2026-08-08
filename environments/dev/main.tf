data "azurerm_subscription" "current" {}

# Needed further down to grant ourselves access to the vault.
data "azurerm_client_config" "current" {}

module "resource_group" {
  source   = "../../modules/resource-group"
  name     = local.resource_group_name
  location = var.location
  tags     = local.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  name                = local.vnet_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
  tags                = local.tags
}

module "subnet" {
  source               = "../../modules/subnet"
  name                 = local.subnet_name
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = var.subnet_address_prefixes
}

module "service_principal" {
  source                 = "../../modules/service-principal"
  service_principal_name = local.service_principal_name
}

# Subscription scope because AKS creates its own node resource group.
resource "azurerm_role_assignment" "aks_contributor" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = module.service_principal.service_principal_object_id
}

module "key_vault" {
  source              = "../../modules/key-vault"
  name                = local.key_vault_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  tags                = local.tags
}

# Vault is RBAC, so creating it is not enough to write secrets into it.
resource "azurerm_role_assignment" "key_vault_secrets_officer" {
  scope                = module.key_vault.key_vault_id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_secret" "sp_client_id" {
  name         = "${local.service_principal_name}-client-id"
  value        = module.service_principal.client_id
  key_vault_id = module.key_vault.key_vault_id

  depends_on = [azurerm_role_assignment.key_vault_secrets_officer]
}

resource "azurerm_key_vault_secret" "sp_client_secret" {
  name         = "${local.service_principal_name}-client-secret"
  value        = module.service_principal.client_secret
  key_vault_id = module.key_vault.key_vault_id

  depends_on = [azurerm_role_assignment.key_vault_secrets_officer]
}

module "aks" {
  source              = "../../modules/aks"
  name                = local.cluster_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  dns_prefix          = local.cluster_name
  subnet_id           = module.subnet.subnet_id
  client_id           = module.service_principal.client_id
  client_secret       = module.service_principal.client_secret
  tags                = local.tags

  depends_on = [azurerm_role_assignment.aks_contributor]
}
