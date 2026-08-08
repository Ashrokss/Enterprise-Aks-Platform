# Storage account creation - smoke test for the module
module "storage_account" {
  source              = "../"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
}
