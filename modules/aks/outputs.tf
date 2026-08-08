output "cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The resource ID of the AKS cluster"
}

output "cluster_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "The name of the AKS cluster"
}

output "cluster_fqdn" {
  value       = azurerm_kubernetes_cluster.aks.fqdn
  description = "The FQDN of the cluster's API server"
}

output "kube_config_raw" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "The kubeconfig used to connect to the cluster"
  sensitive   = true
}
