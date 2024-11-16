module "app" {
  for_each               = var.components
  source                 = "./app"
  ami                    = data.aws_ami.ami1.id
  instance_type          = each.value.instance_type
  vpc_security_group_ids = [data.aws_security_group.example.id]
  name                   = each.key
  zone_id                = data.aws_route53_zone.main.zone_id
}

terraform {
  backend "s3" {
    bucket = "vadali-terraform"
    key    = "terraform/Expense-v1/terraform.tfstate"
    region = "us-east-1"
  }
}