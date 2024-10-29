variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS termination"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to associate with the load balancer"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for ALB deployment"
  type        = list(string)
}

variable "target_port" {
  description = "Port on target instances for health checks and traffic forwarding"
  type        = number
  default     = 80
}
