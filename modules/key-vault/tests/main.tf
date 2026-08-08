# Key Vault creation - smoke test for the module
module "key_vault" {
  source              = "../"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
}
