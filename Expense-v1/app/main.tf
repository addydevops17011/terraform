resource "aws_instance" "ec2-node" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = var.name
  }
}

resource "aws_route53_zone" "record" {
  zone_id = var.zone_id
  name    = "$(var.name)-dev.doubtfree.online"
  type    = A
  ttl     = 30
  records = [
    aws_instance.ec2-node.private_ip
  ]
}


