output "account_id" {
  description = "Cuenta AWS sobre la que se aplico este stack"
  value       = data.aws_caller_identity.current.account_id
}

output "ecr_repository_urls" {
  description = "URLs de los repositorios ECR, para usar en docker push y en los manifiestos"
  value       = { for k, r in aws_ecr_repository.app : k => r.repository_url }
}
