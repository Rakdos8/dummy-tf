terraform {
  required_version = "~> 1.2"

  required_providers {
    aws = {
      version = "~> 4.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    region = format("%s", var.aws_region)
    bucket = "perso-terraform-states"
    key    = format("github.com/%s/dummy-tf.tf", var.aws_region)
  }
}

provider "aws" {
  region = var.aws_region
}
