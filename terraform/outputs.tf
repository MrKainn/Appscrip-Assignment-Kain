output "kubeconfig" {
  description = "Kubeconfig file contents to access EKS cluster"
  value       = module.eks.kubeconfig
  sensitive   = true
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}
