# Resource group creation - smoke test for the module
module "storage_account" {
  source                  = "../"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  storage_account_name    = var.storage_account_name
}
