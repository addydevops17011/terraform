variable "components" {
  default = {
    frontend = {
      instance_type = "t3.small"
    }
    backend = {
      instance_type = "t3.small"
    }
    mysql = {
      instance_type = "t3.small"
    }
  }
}

variable "ami1" {
  default = "ami-09c813fb71547fc4f"
}
variable "vpc_security_group_ids1" {
  default = ["sg-064a6677c666b0183"]
}
