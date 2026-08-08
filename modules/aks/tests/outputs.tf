output "cluster_id" {
  value       = module.aks.cluster_id
  description = "The resource ID of the AKS cluster"
}

output "cluster_name" {
  value       = module.aks.cluster_name
  description = "The name of the AKS cluster"
}

output "cluster_fqdn" {
  value       = module.aks.cluster_fqdn
  description = "The FQDN of the cluster's API server"
}
