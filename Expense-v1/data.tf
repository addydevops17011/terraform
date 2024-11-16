data "aws_route53_zone" "main" {
    name = "doubtfree.online"
    private_zone = false
    }

output "zone" {
  value = data.aws_route53_zone.main
}