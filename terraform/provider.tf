provider "aws" {
  region = var.region
}

# Automatically fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

# Automatically fetch subnets in the default VPC
data "aws_subnets" "eks_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
