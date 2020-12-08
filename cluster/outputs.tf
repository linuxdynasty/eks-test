output "cluster_id" {
  description = "The name/id of the EKS cluster."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "config_map_aws_auth" {
  description = "A kubernetes configmap that allows nodes to authenticate themselves to this EKS cluster control plane."
  value       = module.eks.config_map_aws_auth
}