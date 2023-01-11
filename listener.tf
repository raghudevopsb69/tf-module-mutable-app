resource "aws_lb_listener" "listener" {
  count             = var.component == "frontend" ? 1 : 0
  load_balancer_arn = local.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
