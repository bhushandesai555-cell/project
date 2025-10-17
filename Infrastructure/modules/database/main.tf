# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

# RDS MySQL Instance
resource "aws_db_instance" "main" {
  identifier             = "${var.project_name}-db"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  storage_type          = "gp2"
  db_name               = var.db_name
  username              = var.db_username
  password              = var.db_password
  db_subnet_group_name  = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot   = true
  backup_retention_period = 7
  backup_window         = "03:00-04:00"
  maintenance_window    = "sun:04:00-sun:05:00"
  multi_az             = var.multi_az
  storage_encrypted    = true

  tags = {
    Name = "${var.project_name}-db"
  }
}