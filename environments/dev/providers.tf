terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    # Entra ID objects - only the service-principal module needs this.
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }
}

# features is mandatory even when empty.
provider "azurerm" {
  features {}
}

provider "azuread" {}
