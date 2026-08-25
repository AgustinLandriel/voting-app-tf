terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "voting-app-tf-state-325503636955"
    key          = "k3s/terraform.tfstate"
    use_lockfile = true
    region       = "us-east-2"
    profile      = "alandriel"
  }
}

