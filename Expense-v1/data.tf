data "aws_route53_zone" "main" {
  name         = "doubtfree.online"
  private_zone = false
}

output "zone" {
  value = data.aws_route53_zone.main
}

data "aws_security_group" "example" {
  name = "group-name"
  values= ["Allow-all"]
}

output "security_group" {
  value = data.aws_security_group.example
}

data "aws_ami" "ami1" {
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners      = ["973714476881"]
}