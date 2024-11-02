# VPC and Subnet Data (adjust according to your network setup)
data "aws_vpc" "main_vpc" {
  id = var.vpc_id
}

data "aws_subnet" "public_subnets" {
  vpc_id = data.aws_vpc.main_vpc.id
}

data "aws_subnet" "private_subnets" {
  vpc_id = data.aws_vpc.main_vpc.id
}

# EKS Cluster Module
module "eks" {
  source             = "./modules/eks"
  cluster_name       = var.cluster_name
  private_subnets    = data.aws_subnet.private_subnets.id
  node_desired_size  = var.node_desired_size
  node_max_size      = var.node_max_size
  node_min_size      = var.node_min_size
  node_instance_type = var.node_instance_type
}

# RDS Module
module "rds" {
  source            = "./modules/rds"
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  db_security_group = var.db_security_group
  private_subnets   = data.aws_subnet.private_subnets.id
}


# Load Balancer Module
module "load_balancer" {
  source          = "./modules/load_balancer"
  certificate_arn = var.certificate_arn
  vpc_id          = data.aws_vpc.main_vpc.id
  public_subnets  = data.aws_subnet.public_subnets.id
  target_port     = 80 # Port for the Uvicorn app instances
}

