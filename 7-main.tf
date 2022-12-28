module "db" {
  source = "./database"

  # required variables
  db-name                = try(var.database.db_name, "")
  username               = try(var.database.db_username, "")
  password               = try(var.database.db_password, "")
  db-subnet-group-name   = try(var.database.subnet_group_name, "")
  vpc-security-group-ids = try(var.database.vpc_security_group_ids, [])

  identifier           = try(var.database.identifier, "${var.app_name}-db")
  publicly-accessible  = try(var.database.public_accessible, false)
  apply-immediately    = try(var.database.apply_immediately, null)
  port                 = try(var.database.port, null)
  instance-class       = try(var.database.instance_class, null)
  parameter-group-name = try(var.database.parameter_group_name, null)
  engine               = try(var.database.engine, null)
  engine-version       = try(var.database.engine_version, null)
  allocated-storage    = try(var.database.allocated_storage, null)
  storage-type         = try(var.database.storage_type, null)
  skip-final-snapshot  = try(var.database.skip_final_snapshot, null)
}
