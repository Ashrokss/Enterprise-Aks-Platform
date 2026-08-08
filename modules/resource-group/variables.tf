variable "name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure location/region where the resource group is created"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to the resource group"
}
