resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.app_name}-logs"

  tags = {
    Application = var.app_name
  }
}
