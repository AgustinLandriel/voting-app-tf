variable "region" {
  description = "Region de AWS donde se crean los recursos"
  type        = string
  default     = "us-east-2"
}

variable "aws_profile" {
  description = "Perfil del CLI en ~/.aws/credentials usado para autenticar"
  type        = string
  default     = "alandriel"
}

variable "project" {
  description = "Nombre del proyecto, usado en tags y en el prefijo de los repos ECR"
  type        = string
  default     = "voting-app"
}

variable "ecr_repositories" {
  description = "Servicios que necesitan repositorio propio en ECR"
  type        = set(string)
  default     = ["vote", "worker", "result"]
}

variable "ecr_keep_last_images" {
  description = "Cuantas imagenes tagueadas retiene la lifecycle policy antes de expirar las viejas"
  type        = number
  default     = 10
}
