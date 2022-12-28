resource "aws_alb" "application_load_balancer" {
  name               = "${var.app_name}-alb"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  subnets            = var.lb.subnets
  security_groups    = var.lb.security_groups

  tags = {
    Name = "${var.app_name}-alb"
  }
}

resource "aws_lb_target_group" "tg" {
  name        = "${var.app_name}-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = "3"
    interval            = "10"
    timeout             = "3"
    unhealthy_threshold = "2"
    protocol            = "HTTP"
    matcher             = "200"
  }

  tags = {
    Name = "${var.app_name}-lb-tg"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.application_load_balancer.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
