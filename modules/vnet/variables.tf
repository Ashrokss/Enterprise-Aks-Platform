variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network"
}

variable "location" {
  type        = string
  description = "The Azure location/region where the virtual network is created"
}

variable "address_space" {
  type        = list(string)
  description = "The address spaces used by the virtual network (CIDR blocks)"
}

variable "dns_servers" {
  type        = list(string)
  default     = []
  description = "Custom DNS servers for the virtual network. Empty uses Azure-provided DNS."
}