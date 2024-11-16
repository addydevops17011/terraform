resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-064a6677c666b0183"]
  tags = {
    Name = "frontend-dev"
  }
}


