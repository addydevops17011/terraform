data "aws_route53_zone" "main" {
    name = "doubtfree.online"
    private_zone = false
    }

output "zone" {
  value = data.aws_route53_zone.main
}

data "aws_security_group" "example" {
  id = "sg-064a6677c666b0183"
}

output "security_group" {
  value = data.aws_security_group.example
}
