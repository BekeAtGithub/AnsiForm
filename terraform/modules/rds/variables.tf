variable "db_name" {
  description = "Name of the database to create in the RDS instance"
  type        = string
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance in GB"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "Storage type for the RDS instance (e.g., gp2)"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "Database engine (e.g., postgres, mysql)"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Version of the database engine"
  type        = string
  default     = "12.7"
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type        = string
  default     = "db.t3.medium"
}

variable "private_subnets" {
  description = "List of private subnets for RDS deployment"
  type        = list(string)
}

variable "db_security_group" {
  description = "Security group ID for the RDS instance"
  type        = string
}
