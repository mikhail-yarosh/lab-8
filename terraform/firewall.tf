resource "aws_security_group" "lab_8" {
  name        = var.env
  description = "Allow http/s and devops inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    # Maybe, not the best idea.. In GCP we must to allow LB healthchecks at least, for AWS, probably, same.
    description = "Allow http from everywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow https from everywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Could be usefull to test something directly.
  ingress {
    description = "Allow all from devops"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.devops_allowed_networks
  }

  dynamic "ingress" {
    for_each = var.vpc_networks
    content {
      description = "Allow ALL from project subnet ${ingress.value}"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.env
  }
}

