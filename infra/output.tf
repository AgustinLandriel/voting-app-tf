output "RDS_ADDRESS" {
  value       = module.rds.rds_address
  description = "Pegar en DATABASE_HOST de k8s/postgres/configMaps.yaml"
}
output "RDS_ENDPOINT" {
  value       = module.rds.rds_endpoint
  description = "URL de la DB"
}
