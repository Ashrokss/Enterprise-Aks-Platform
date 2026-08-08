locals {
  # Prefixes every name so dev and staging never collide.
  prefix = "${var.project}-${var.environment}"

  resource_group_name    = "${local.prefix}-rg"
  vnet_name              = "${local.prefix}-vnet"
  subnet_name            = "${local.prefix}-subnet"
  cluster_name           = "${local.prefix}-aks"
  service_principal_name = "${local.prefix}-sp"

  # Vault names are global, hence the suffix. This one lands on exactly 24
  # characters, which is the limit, so a longer project name would break it.
  key_vault_name = "${local.prefix}-kv-19bd"

  # Goes on everything that takes tags.
  tags = {
    project     = var.project
    environment = var.environment
    managed_by  = "terraform"
  }
}
