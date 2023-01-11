//resource "aws_lb_listener" "listener" {
//  load_balancer_arn = local.lb_arn
//  port              = "80"
//  protocol          = "HTTP"
//
//  default_action {
//    type             = "forward"
//    target_group_arn = aws_lb_target_group.tg.arn
//  }
//}
