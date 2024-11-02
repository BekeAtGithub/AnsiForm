# RDS Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "${var.db_name}-subnet-group"
  subnet_ids  = var.private_subnets
  description = "Subnet group for RDS"
}

# RDS Instance
resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.db_security_group]
  skip_final_snapshot    = true
  publicly_accessible    = false
}
