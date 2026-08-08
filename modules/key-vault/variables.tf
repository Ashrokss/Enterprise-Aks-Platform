variable "name" {
  type        = string
  description = "The name of the Key Vault. Must be globally unique across Azure."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Key Vault"
}

variable "location" {
  type        = string
  description = "The Azure location/region where the Key Vault is created"
}

variable "sku_name" {
  type        = string
  default     = "standard"
  description = "The Key Vault SKU, either standard or premium"
}

variable "rbac_authorization_enabled" {
  type        = bool
  default     = true
  description = "Use Azure RBAC instead of access policies to control access to secrets"
}

variable "soft_delete_retention_days" {
  type        = number
  default     = 7
  description = "Number of days a deleted vault can be recovered. Cannot be changed after creation."
}

variable "purge_protection_enabled" {
  type        = bool
  default     = false
  description = "Prevents permanent deletion before the retention period ends. Cannot be disabled once enabled."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to the Key Vault"
}
