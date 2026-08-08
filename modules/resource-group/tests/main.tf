# Resource group creation - smoke test for the module
module "resource_group" {
  for_each = var.resource_groups
  source   = "../"
  name     = each.value.name
  location = each.value.location
}