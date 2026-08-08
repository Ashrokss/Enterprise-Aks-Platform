variable "name" {
  type        = string
  description = "The name of the subnet"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the subnet"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network to which to attach the subnet"
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the subnet (CIDR blocks)"
}