variable "region" {
  description = "AWS region for deploying resources"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC for EKS, RDS, and ALB"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
}

variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance (GB)"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type for the RDS instance (e.g., gp2)"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "Database engine for the RDS instance"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version for the RDS instance"
  type        = string
  default     = "12.7"
}

variable "instance_class" {
  description = "Instance class for the RDS database"
  type        = string
  default     = "db.t3.medium"
}

variable "db_security_group" {
  description = "Security group ID for the RDS instance"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the SSL certificate for ALB HTTPS termination"
  type        = string
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform remote state"
  type        = string
}

variable "state_key" {
  description = "Key for the Terraform state file in S3"
  type        = string
}
