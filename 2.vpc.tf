resource "aws_vpc" "Ansible-VPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name              = var.vpc_name
    Owner             = "Viswanadh"
    environment       = local.new_environment
    Terraform-Managed = "Yes"
    ProjectID         = local.projid
  }
}

resource "aws_internet_gateway" "Ansible-IGW" {
  vpc_id = aws_vpc.Ansible-VPC.id
  tags = {
    Name              = "${var.vpc_name}-IGW"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}
