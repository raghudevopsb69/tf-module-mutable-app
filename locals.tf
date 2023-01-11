locals {
  vpc_id              = lookup(lookup(var.vpc, var.env, null), "vpc_id", null)
  app_subnets_cidr    = lookup(lookup(var.vpc, var.env, null), "app_subnets_cidr", null)
  public_subnets_cidr = lookup(lookup(var.vpc, var.env, null), "public_subnets_cidr", null)
  app_subnets_ids     = lookup(lookup(var.vpc, var.env, null), "app_subnets_ids", null)
  public_subnets_ids  = lookup(lookup(var.vpc, var.env, null), "public_subnets_ids", null)

  allow_app_access = var.component == "frontend" ? local.public_subnets_cidr : local.app_subnets_cidr

  public_lb_arn  = { for k, v in var.load_balancers : k => lookup(v.public, "arn", null) }
  private_lb_arn = { for k, v in var.load_balancers : k => lookup(v.private, "arn", null) }

  lb_arn = var.component == "frontend" ? local.public_lb_arn : local.private_lb_arn

}

