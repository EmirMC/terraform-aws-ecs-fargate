module "db" {
  source = "./postgres-db"
  create = try(var.postgres.db_name, false) * try(var.postgres.db_password, false) * try(var.postgres.db_username, false) * try(var.postgres.subnet_group_name, false)

  # required variables
  db-name                = try(var.postgres.db_name, "")
  username               = try(var.postgres.db_username, "")
  password               = try(var.postgres.db_password, "")
  db-subnet-group-name   = try(var.postgres.subnet_group_name, "")
  vpc-security-group-ids = try(var.postgres.vpc_security_group_ids, [])

  identifier           = try(var.postgres.identifier, "${var.app_name}-db")
  publicly-accessible  = try(var.postgres.public_accessible, false)
  apply-immediately    = try(var.postgres.apply_immediately, null)
  port                 = try(var.postgres.port, null)
  instance-class       = try(var.postgres.instance_class, null)
  parameter-group-name = try(var.postgres.parameter_group_name, null)
  engine               = try(var.postgres.engine, null)
  engine-version       = try(var.postgres.engine_version, null)
  allocated-storage    = try(var.postgres.allocated_storage, null)
  storage-type         = try(var.postgres.storage_type, null)
  skip-final-snapshot  = try(var.postgres.skip_final_snapshot, null)
}
