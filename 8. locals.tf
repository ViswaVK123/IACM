locals {
  new_environment          = lower(var.environment)
  projid                   = format("%s-%s", lower(var.vpc_name), lower(var.projid))
  new_public_subnet_cidrs  = distinct(var.public_subnet_cidrs)
  new_private_subnet_cidrs = distinct(var.private_subnet_cidrs)
}
