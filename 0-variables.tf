variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "app_name" {
  type    = string
  default = "default-service"
}

variable "vpc_id" {
  type = string
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "database" {
  description = "Database DB configuration (Default Postgres14 RDS)"
  type        = any
  default     = {}
}

variable "lb" {
  description = "Load balancer configuration"
  type = object({
    subnets         = list(string)
    security_groups = list(string)
  })
}

variable "ecs" {
  description = "ECS Cluster & Service configuration"
  type = object({
    cluster         = string
    cluster_name    = string
    security_groups = list(string)
    task_role       = string
    subnets         = list(string)
  })
}
