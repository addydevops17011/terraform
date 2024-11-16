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


