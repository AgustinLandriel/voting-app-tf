module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier = var.name_db

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.username
  password = var.password
  port     = "5432"

  vpc_security_group_ids = var.db_security_group_ids

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = var.subnet_ids

  # DB parameter group
  family = var.family

  # DB option group
  major_engine_version        = var.major_engine_version
  skip_final_snapshot         = true
  publicly_accessible         = true
  manage_master_user_password = false

}
