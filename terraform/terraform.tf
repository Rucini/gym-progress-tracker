terraform {
  required_version = ">= 1.9.0"

  backend "s3" {
    bucket       = "rucini-gym-progress-tracker-001"
    key          = "gym-progress-tracker/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}