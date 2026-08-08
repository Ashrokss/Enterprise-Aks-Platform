# VNet creation - smoke test for the module
module "vnet" {
  source              = "../"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
}
