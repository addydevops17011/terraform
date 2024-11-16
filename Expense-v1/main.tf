module "app" {
  for_each               = var.components
  source                 = "./app"
  ami                    = var.ami1
  instance_type          = each.value.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids1
  name                   = each.key
  zone_id                = data.aws_route53_zone.main.zone_id
}

