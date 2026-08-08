# AKS cluster creation - smoke test for the module.
# The cluster needs a service principal, so the two modules are composed here
# the same way the dev environment will compose them.
data "azurerm_subscription" "current" {}

module "service_principal" {
  source                 = "../../service-principal"
  service_principal_name = var.service_principal_name
}

# AKS needs permission to manage resources such as load balancers and disks.
resource "azurerm_role_assignment" "sp_contributor" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = module.service_principal.service_principal_object_id
}

module "aks" {
  source              = "../"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix
  subnet_id           = var.subnet_id
  client_id           = module.service_principal.client_id
  client_secret       = module.service_principal.client_secret

  # The role assignment must exist before AKS validates the service principal.
  depends_on = [azurerm_role_assignment.sp_contributor]
}
