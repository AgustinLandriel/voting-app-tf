resource "aws_ecr_repository" "app" {
  for_each = var.ecr_repositories

  name                 = "${var.project}/${each.value}"
  image_tag_mutability = "MUTABLE"

  # Permite destruir el repo aunque tenga imagenes adentro. Comodo mientras
  # se itera; conviene pasarlo a false cuando esto sea productivo.
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}

# Sin esto las imagenes viejas se acumulan para siempre y el storage se paga.
resource "aws_ecr_lifecycle_policy" "app" {
  for_each = aws_ecr_repository.app

  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Expirar imagenes sin tag despues de 1 dia"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 1
        }
        action = { type = "expire" }
      },
      {
        rulePriority = 2
        description  = "Retener solo las ultimas ${var.ecr_keep_last_images} imagenes tagueadas"
        selection = {
          tagStatus      = "tagged"
          tagPatternList = ["*"]
          countType      = "imageCountMoreThan"
          countNumber    = var.ecr_keep_last_images
        }
        action = { type = "expire" }
      },
    ]
  })
}
