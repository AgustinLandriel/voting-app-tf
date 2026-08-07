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

variable "name" {
  type        = string
  description = "nombre de la vpc"
}

variable "cidr" {
  type        = string
  description = "CIDR de la VPC"
}

variable "azs" {
  type        = list(string)
  description = "Zonas de disponibilidad"
}

variable "private_subnets" {
  type        = list(string)
  description = "Subredes privadas"
}

variable "public_subnets" {
  type        = list(string)
  description = "Subredes públicas"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Habilitar NAT Gateway"

}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Habilitar DNS Hostnames"
}

variable "name_sg" {
  description = "nombre de security group de postgres."
  type        = string
}


variable "public_ip" {
  description = "IP publica de mi maquina donde corro minikube para permitir el acceso a la base de datos desde internet."
  type        = string
}

variable "name_db" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "database" {
  description = "Nombre de la base que crea RDS al inicializar"
  type        = string
}

variable "username" {
  description = "Usuario master"
  type        = string
}

variable "password" {
  description = "Password del usuario master, leida de Secrets Manager"
  type        = string
  sensitive   = true
}
