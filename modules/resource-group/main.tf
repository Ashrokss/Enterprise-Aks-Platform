# This module creates a resource group in Azure.
resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
}