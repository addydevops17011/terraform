resource "aws_instance" "ec2-nodes" {
  for_each = var.components
  ami      = "ami-09c813fb71547fc4f"
  #check a values exits in map or not
  instance_type          = each.value.instance_type == null ? "t2.micro" : each.value.instance_type
  vpc_security_group_ids = ["sg-064a6677c666b0183"]
  tags = {
    Name = each.key
  }
}

variable "components" {
  default = {
    frontend = {

    }
    backend = {
    }
    mysql = {
      instance_type = "t2.micro"
    }
  }
}