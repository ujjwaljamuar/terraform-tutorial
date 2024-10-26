variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    ap-south-1   = "ami-09b0a86a2c84101e1"
    amazon-linux = "ami-04a37924ffe27da53"
  }
}

variable "USER" {
  default = "ec2-user"
}
