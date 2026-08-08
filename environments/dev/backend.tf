# No variables allowed in here, so these are literal. See scripts/init.sh.
# key has to differ per environment or dev and staging share one state file.
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfdevbackend2026ashish"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
