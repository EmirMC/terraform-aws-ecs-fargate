resource "aws_db_instance" "default" {
  count                  = var.create ? 1 : 0
  allocated_storage      = var.allocated-storage
  storage_type           = var.storage-type
  engine                 = var.engine
  engine_version         = var.engine-version
  instance_class         = var.instance-class
  db_name                = var.db-name
  identifier             = var.identifier
  username               = var.username
  password               = var.password
  port                   = var.port
  publicly_accessible    = var.publicly-accessible
  db_subnet_group_name   = var.db-subnet-group-name
  parameter_group_name   = var.parameter-group-name
  vpc_security_group_ids = var.vpc-security-group-ids
  apply_immediately      = var.apply-immediately
  skip_final_snapshot    = var.skip-final-snapshot
}
