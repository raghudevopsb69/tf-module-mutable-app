resource "aws_security_group" "allow_app" {
  name        = "${var.env}_allow_${var.component}"
  description = "Allow ${var.component} Access"
  vpc_id      = local.vpc_id

  ingress {
    description = "APP"
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = local.allow_app_access
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allow_ssh_cidr
  }

  ingress {
    description = "PROMETHEUS"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = var.allow_ssh_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}_allow_${var.component}"
  }
}



