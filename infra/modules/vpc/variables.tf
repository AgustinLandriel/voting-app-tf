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
