# Whoever runs Terraform ends up owning the app and the SP.
data "azuread_client_config" "current" {}

# An SP has to be created from an app registration.
resource "azuread_application" "app" {
  display_name = var.service_principal_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "sp" {
  client_id = azuread_application.app.client_id
  owners    = [data.azuread_client_config.current.object_id]
}

# The secret ends up in state, so keep the backend remote and private.
resource "azuread_service_principal_password" "sp" {
  service_principal_id = azuread_service_principal.sp.id
}
