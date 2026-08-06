module "postgresql_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/postgresql"
  version = "~> 6.0"

  name        = var.name
  description = "Security group for postgresql"
  vpc_id      = var.vpc_id

  ingress_cidr_ipv4 = {
    vpc = "${var.vpc_cidr}"

  }

  egress_rules = {
    all = {
      cidr_ipv4   = "0.0.0.0/0"
      ip_protocol = "-1"
      description = "Salida sin restriccion"
    }
  }
}
