# Subnet creation - smoke test for the module
module "subnet" {
  source                              = "../"
  name                                = var.name
  resource_group_name                 = var.resource_group_name
  virtual_network_name                = var.virtual_network_name
  address_prefixes                    = var.address_prefixes
}