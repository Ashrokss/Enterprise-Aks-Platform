variable "project" {
  type        = string
  description = "Short project name used as the first part of every resource name"
}

variable "environment" {
  type        = string
  description = "Environment name used in resource names and tags, for example dev or staging"
}

variable "location" {
  type        = string
  description = "The Azure region all resources are created in"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space of the virtual network (CIDR blocks)"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "The address prefixes of the subnet hosting the AKS nodes (CIDR blocks)"
}
