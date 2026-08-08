# Looks up the identity Terraform is running as, used as the owner of the app.
data "azuread_client_config" "current" {}

# The app registration that the service principal is created from.
resource "azuread_application" "app" {
  display_name = var.service_principal_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "sp" {
  client_id = azuread_application.app.client_id
  owners    = [data.azuread_client_config.current.object_id]
}

# Generates the client secret. Terraform keeps this value in state,
# which is why the state file must stay remote and private.
resource "azuread_service_principal_password" "sp" {
  service_principal_id = azuread_service_principal.sp.id
}
