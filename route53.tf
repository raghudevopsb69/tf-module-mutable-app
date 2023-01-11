resource "aws_route53_record" "component" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.env}-${var.component}.${var.domain}"
  type    = "A"
  ttl     = 30
  records = []
}

