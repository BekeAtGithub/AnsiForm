variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "node_desired_capacity" {
  description = "Desired number of worker nodes in the EKS cluster"
  type        = number
  default     = 2
}

variable "node_max_capacity" {
  description = "Maximum number of worker nodes in the EKS cluster"
  type        = number
  default     = 3
}

variable "node_min_capacity" {
  description = "Minimum number of worker nodes in the EKS cluster"
  type        = number
  default     = 1
}

variable "node_instance_type" {
  description = "The instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}
