terraform {
  backend "s3" {
    bucket = "kub8"
    key    = "terraform/backend "
    region = "ap-south-1"
  }
}