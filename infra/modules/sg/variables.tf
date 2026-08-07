variable "name" {
  description = "The name of the security group."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
  type        = string
}

variable "public_ip" {
  description = "IP publica de mi maquina donde corro minikube para permitir el acceso a la base de datos desde internet."
  type        = string
}
