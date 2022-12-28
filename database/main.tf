locals {
  allocated_storage    = var.allocated-storage != null ? var.allocated-storage : 20
  storage_type         = var.storage-type != null ? var.storage-type : "gp2"
  engine               = var.engine != null ? var.engine : "postgres"
  engine_version       = var.engine-version != null ? var.engine-version : "14.5"
  instance_class       = var.instance-class != null ? var.instance-class : "db.t3.micro"
  parameter_group_name = var.parameter-group-name != null ? var.parameter-group-name : "default.postgres14"
  port                 = var.port != null ? var.port : 5432
}

resource "aws_db_instance" "default" {
  count                  = var.create ? 1 : 0
  allocated_storage      = local.allocated_storage
  storage_type           = local.storage_type
  engine                 = local.engine
  engine_version         = local.engine_version
  instance_class         = local.instance_class
  parameter_group_name   = local.parameter_group_name
  port                   = local.port
  db_name                = var.db-name
  identifier             = var.identifier
  username               = var.username
  password               = var.password
  publicly_accessible    = var.publicly-accessible
  db_subnet_group_name   = var.db-subnet-group-name
  vpc_security_group_ids = var.vpc-security-group-ids
  apply_immediately      = var.apply-immediately
  skip_final_snapshot    = var.skip-final-snapshot
}
