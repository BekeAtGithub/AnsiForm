# Provider Configuration
provider "aws" {
  region = var.region
}

# VPC and Subnet Data (adjust according to your network setup)
data "aws_vpc" "main_vpc" {
  id = var.vpc_id
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.main_vpc.id
}

data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.main_vpc.id
}

# EKS Cluster Module
module "eks" {
  source              = "./modules/eks"
  cluster_name        = var.cluster_name
  private_subnets     = data.aws_subnet_ids.private_subnets.ids
  node_desired_size   = var.node_desired_size
  node_max_size       = var.node_max_size
  node_min_size       = var.node_min_size
  node_instance_type  = var.node_instance_type
}

# RDS Module
module "rds" {
  source               = "./modules/rds"
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_security_group    = var.db_security_group
  private_subnets      = data.aws_subnet_ids.private_subnets.ids
}

# Load Balancer Module
module "load_balancer" {
  source            = "./modules/load_balancer"
  certificate_arn   = var.certificate_arn
  vpc_id            = data.aws_vpc.main_vpc.id
  public_subnets    = data.aws_subnet_ids.public_subnets.ids
  target_port       = 80  # Port for the Uvicorn app instances
}

# Outputs
output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "rds_endpoint" {
  value = module.rds.rds_instance_endpoint
}

output "load_balancer_dns" {
  value = module.load_balancer.load_balancer_dns_name
}
