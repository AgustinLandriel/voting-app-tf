output "DB_HOST" {
  value       = module.rds.rds_address
  description = "Pegar en DATABASE_HOST de k8s/postgres/configMaps.yaml"
}
output "DB_ENDPOINT" {
  value       = module.rds.rds_endpoint
  description = "Pegar en DATABASE_URL de k8s/postgres/configMaps.yaml"
}
