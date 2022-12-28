output "db_address" {
  value = module.db.address
}

output "ecr_repository_url" {
  value = aws_ecr_repository.repo.repository_url
}

output "alb_dns" {
  value = aws_alb.application_load_balancer.dns_name
}

output "ecs_service_name" {
  value = aws_ecs_service.main.name
}
