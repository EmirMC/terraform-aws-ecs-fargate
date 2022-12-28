resource "aws_ecs_service" "main" {
  name                 = var.app_name
  cluster              = var.ecs.cluster #
  task_definition      = aws_ecs_task_definition.definition.arn
  force_new_deployment = true
  scheduling_strategy  = "REPLICA"
  launch_type          = "FARGATE"

  network_configuration {
    subnets          = var.ecs.subnets
    assign_public_ip = false
    security_groups  = var.ecs.security_groups
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "${var.app_name}-container"
    container_port   = var.container_port
  }
  desired_count = 1

  depends_on = [aws_lb_listener.listener]
  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 50
}

resource "aws_ecs_task_definition" "definition" {
  family                   = "${var.app_name}-task-definition"
  task_role_arn            = var.ecs.task_role
  execution_role_arn       = var.ecs.task_role
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode([
    {
      name      = "${var.app_name}-container"
      image     = "${aws_ecr_repository.repo.repository_url}:latest"
      cpu       = 512
      memory    = 1024
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "${aws_cloudwatch_log_group.log-group.name}"
          "awslogs-region"        = "${var.aws_region}"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}
