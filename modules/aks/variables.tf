variable "name" {
  type        = string
  description = "The name of the AKS cluster"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the AKS cluster"
}

variable "location" {
  type        = string
  description = "The Azure location/region where the AKS cluster is created"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix used for the cluster's API server endpoint"
}

variable "subnet_id" {
  type        = string
  description = "The resource ID of the subnet the nodes are placed in"
}

variable "client_id" {
  type        = string
  description = "The client ID of the service principal AKS uses to manage Azure resources"
}

variable "client_secret" {
  type        = string
  sensitive   = true
  description = "The client secret of the service principal AKS uses to manage Azure resources"
}

variable "node_count" {
  type        = number
  default     = 1
  description = "Number of nodes in the default node pool"
}

variable "vm_size" {
  type        = string
  default     = "Standard_D2s_v3"
  description = "The VM size used for the nodes"
}

variable "kubernetes_version" {
  type        = string
  default     = null
  description = "Kubernetes version for the cluster. Null lets Azure pick the default for the region."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to the AKS cluster"
}
