output "sg_id" {
  value       = module.postgresql_security_group.id
  description = "The ID of the security group created for PostgreSQL."
}

