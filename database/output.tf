output "address" {
  value = aws_db_instance.default[0].address
  depends_on = [
    aws_db_instance.default
  ]
}
