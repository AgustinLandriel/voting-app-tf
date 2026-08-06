data "aws_caller_identity" "current" {}

provider "aws" {
  region  = var.region
  profile = var.aws_profile

  default_tags {
    tags = {
      Project   = var.project
      ManagedBy = "terraform"
      Repo      = "voting-app-tf"
    }
  }
}
