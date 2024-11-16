data "aws_route53_zone" "main" {
    name = "doubtfree.online"
    private_zone = false
    }

output "zone" {
  value = data.aws_route53_zone.main
}

data "aws_security_group" "example" {
  name = "Allow-all"
}

output "security_group" {
  value = data.aws_security_group.example
}
