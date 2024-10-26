terraform {
  backend "s3" {
    bucket = "kub8"
    key    = "terraform/backend-multi-resource"
    region = "ap-south-1"
  }
}