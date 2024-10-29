output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = module.eks.eks_cluster_endpoint
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.eks_cluster_name
}

output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = module.rds.rds_instance_endpoint
}

output "load_balancer_dns" {
  description = "DNS name of the Application Load Balancer"
  value       = module.load_balancer.load_balancer_dns_name
}

output "load_balancer_arn" {
  description = "ARN of the Application Load Balancer"
  value       = module.load_balancer.load_balancer_arn
}
