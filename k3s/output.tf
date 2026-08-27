output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.vpc.vpc_id
}

output "instance_id" {

  value = aws_instance.k3s.id

}

output "security_group_id" {
  description = "ID del security group creado"
  value       = aws_security_group.k3s_sg.id
}
output "public_ip" {
  value = aws_instance.k3s.public_ip
}


output "public_subnets" {
  description = "Subredes publicas de la VPC creada"
  value       = module.vpc.public_subnets
}
