data "aws_secretsmanager_secret" "voting-app" {
  name = "voting-app"
}

data "aws_secretsmanager_secret_version" "voting-app" {
  secret_id = data.aws_secretsmanager_secret.voting-app.id
}

locals {
  db_credenciales = jsondecode(data.aws_secretsmanager_secret_version.voting-app.secret_string)
}
