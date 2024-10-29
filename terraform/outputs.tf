output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "rds_instance_endpoint" {
  value = module.rds.rds_instance_endpoint
}

output "load_balancer_dns_name" {
  value = module.load_balancer.load_balancer_dns_name
}
