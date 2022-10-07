terraform {
  required_version = "~> 1.2"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    region = var.aws_region
    bucket = "perso-terraform-states"
    key    = "github.com/eu-west-3/dummy-tf.tf"
  }
}

provider "aws" {
  region = var.aws_region
}
