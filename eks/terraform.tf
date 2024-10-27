terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.70.0"
    }

    // to encrypt keys certificates
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }


    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }
  }

  backend "s3" {
    bucket = "kub8"
    key    = "state/terraform.tfstate"
    region = "ap-south-1"
  }

  required_version = "~> 1.3"
}