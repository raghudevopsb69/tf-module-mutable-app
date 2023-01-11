//resource "aws_lb_listener" "listener_public" {
//  count             = var.component == "frontend" ? 1 : 0
//  load_balancer_arn = local.arn
//  port              = "80"
//  protocol          = "HTTP"
//
//  default_action {
//    type             = "forward"
//    target_group_arn = aws_lb_target_group.tg.arn
//  }
//}

resource "aws_lb_listener" "listener_private" {
  count             = var.component == "frontend" ? 0 : 1
  load_balancer_arn = local.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "404"
    }
  }
}
