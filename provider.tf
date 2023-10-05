provider "aws" {
  region = "us-east-1"
}

terraform {

  backend "s3" {
    bucket = "anthony18"
    region = "us-east-1"
    key    = "ssh-key/terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.36"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
