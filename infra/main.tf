terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Mismo bucket que bootstrap, pero otro key: es otro state, independiente.
  backend "s3" {
    bucket       = "voting-app-tf-state-325503636955"
    key          = "infra/terraform.tfstate"
    use_lockfile = true
    region       = "us-east-2"
    profile      = "alandriel"
  }
}

module "vpc" {
  source               = "./modules/vpc"
  name                 = var.name
  cidr                 = var.cidr
  azs                  = var.azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  enable_nat_gateway   = var.enable_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
}

module "postgresql_security_group" {
  source    = "./modules/sg"
  name      = var.name_sg
  vpc_id    = module.vpc.vpc_id
  public_ip = var.public_ip
}

module "rds" {
  source                = "./modules/rds"
  name_db               = var.name_db
  engine                = "postgres"
  engine_version        = "17"
  instance_class        = "db.t4g.micro"
  allocated_storage     = 20
  db_security_group_ids = [module.postgresql_security_group.sg_id]
  subnet_ids            = module.vpc.public_subnets
  family                = "postgres17"
  major_engine_version  = "17"
}
