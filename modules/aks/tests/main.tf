# AKS cluster creation - smoke test for the module
# Pulls in the service-principal module because AKS cannot come up without one.
data "azurerm_subscription" "current" {}

module "service_principal" {
  source                 = "../../service-principal"
  service_principal_name = var.service_principal_name
}

# Contributor on the subscription, or AKS cannot manage load balancers and disks.
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

  # AKS validates the SP up front, so the role has to land first.
  depends_on = [azurerm_role_assignment.sp_contributor]
}
