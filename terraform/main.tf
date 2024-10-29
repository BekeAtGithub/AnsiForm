module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.1.0"                   # Adjust as necessary
  cluster_name    = var.cluster_name
  cluster_version = "1.27"
  vpc_id          = data.aws_vpc.default.id
  subnets         = data.aws_subnets.eks_subnets.ids
  enable_irsa     = true
}

resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = module.eks.cluster_id
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = module.eks.worker_iam_role_arn
  subnet_ids      = data.aws_subnets.eks_subnets.ids
  instance_types  = [var.node_instance_type]
  
  scaling_config {
    desired_size = var.node_desired_capacity
    max_size     = var.node_max_capacity
    min_size     = var.node_min_capacity
  }

  lifecycle {
    create_before_destroy = true
  }
}
