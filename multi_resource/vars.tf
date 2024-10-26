variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "ZONE2" {
  default = "ap-south-1b"
}

variable "ZONE3" {
  default = "ap-south-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    ubuntu       = "ami-09b0a86a2c84101e1"
    amazon-linux = "ami-04a37924ffe27da53"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "tf-kp.pub"
}

variable "PRIV_KEY" {
  default = "tf-kp"
}