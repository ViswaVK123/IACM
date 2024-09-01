resource "aws_instance" "webservers" {
  #count                       = local.new_environment == "production" ? 3 : 1
  count                       = length(local.new_public_subnet_cidrs)
  ami                         = lookup(var.ami, var.awsregion)
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.SG-Dynamic.id}"]
  associate_public_ip_address = true
  tags = {
    Name              = "${var.vpc_name}-PublicServer-${count.index + 1}"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
    ManagedBy         = "Terraform"
  }
}
