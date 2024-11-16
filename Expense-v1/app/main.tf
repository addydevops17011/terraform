resource "aws_instance" "ec2-node" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = var.name
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = self.public_ip # Using public_ip instead of private_ip
  }

  provisioner "local-exec" { # Using remote-exec instead of local-exec
    command = "sleep 120; cd /home/ec2-user/ansible-expense; ansible-playbook -i ${self.private_ip} -e ansible_user=ec2-user -e ansible_password=DevOps321 -e role_name=${var.name} -e env_name=dev expense.yml"
  }
}

resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = "${var.name}.doubtfree.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2-node.public_ip] # Using public_ip instead of private_ip
}