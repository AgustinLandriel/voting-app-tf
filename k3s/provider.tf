provider "aws" {
  region  = "us-east-2"
  profile = "alandriel"

  default_tags {
    tags = {
      ManagedBy = "terraform"
      Repo      = "voting-app-tf"
    }
  }
}
