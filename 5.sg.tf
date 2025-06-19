locals {
  ingress = toset([80, 22, 443, 3389, 7000, 7001, 3306, 1433, 5439, 5432, 1521, 2409])
  egress  = toset([80, 22, 443, 3389, 7000, 7001, 3306, 1433, 5439, 5432, 1521, 2409])
}
resource "aws_security_group" "SG-Dynamic" {
  name        = "Allow-All-SG-Dynamic"
  description = "allow all inbound traffic using dynamic"
  vpc_id      = aws_vpc.Harness-VPC.

  dynamic "ingress" {
    for_each = local.ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = local.egress
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

