variable "name_db" {
  description = "Nombre de la base de datos"
  type        = string

}

variable "engine" {
  description = "Motor de base de datos"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Version del motor de base de datos"
  type        = string
  default     = "17"
}

variable "db_security_group_ids" {
  description = "IDs de los security groups asociados a la base de datos"
  type        = list(string)

}

variable "subnet_ids" {
  description = "IDs de las subnets donde se desplegara la base de datos"
  type        = list(string)
}
variable "instance_class" {
  description = "Clase de instancia de base de datos"
  type        = string
  default     = "db.t4g.micro"
}
variable "allocated_storage" {
  description = "Almacenamiento asignado para la base de datos"
  type        = number
  default     = 20
}

variable "family" {
  description = "Familia del grupo de parametros de la base de datos"
  type        = string
  default     = "postgres17"
}

variable "major_engine_version" {
  description = "Version mayor del motor de base de datos"
  type        = string
  default     = "17"
}

variable "db_name" {
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
