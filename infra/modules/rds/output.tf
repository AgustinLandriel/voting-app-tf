output "rds_endpoint" {
  value       = module.db.db_instance_endpoint
  description = "The endpoint of the RDS instance."
}
output "rds_address" {
  value       = module.db.db_instance_address
  description = "The address of the RDS instance."
}
