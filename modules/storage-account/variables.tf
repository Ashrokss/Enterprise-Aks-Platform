variable "name" {
  type        = string
  description = "The name of the storage account. Must be globally unique, 3-24 lowercase letters and digits."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the storage account"
}

variable "location" {
  type        = string
  description = "The Azure location/region where the storage account is created"
}

variable "account_kind" {
  type        = string
  default     = "StorageV2"
  description = "The kind of storage account, for example StorageV2 or BlobStorage"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "The performance tier of the storage account, either Standard or Premium"
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "The replication strategy, for example LRS, ZRS or GRS"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to the storage account"
}
