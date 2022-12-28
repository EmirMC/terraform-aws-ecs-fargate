output "address" {
  value = local.create ? aws_db_instance.default[0].address : ""
}
