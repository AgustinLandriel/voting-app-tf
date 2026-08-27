module "vpc" {

  source = "../infra/modules/vpc"

  name                 = "k3s-vpc"
  cidr                 = "10.20.0.0/16"
  azs                  = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets      = ["10.20.10.0/24", "10.20.20.0/24", "10.20.30.0/24"]
  public_subnets       = ["10.20.50.0/24", "10.20.60.0/24", "10.20.70.0/24"]
  enable_nat_gateway   = false
  enable_dns_hostnames = true
}

data "aws_ssm_parameter" "al2023" {

  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"

}


resource "aws_instance" "k3s" {
  ami                         = data.aws_ssm_parameter.al2023.name
  instance_type               = "t3.medium"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.k3s_sg.id]
  associate_public_ip_address = true
  user_data_replace_on_change = true
  iam_instance_profile        = data.aws_iam_instance_profile.ssm.name
  user_data                   = file("${path.module}/scripts/install-k3s.sh")


  tags = {
    Name = "k3s-cluster"
  }
}

resource "aws_security_group" "k3s_sg" {
  name        = "k3s-sg"
  description = "Security group for k3s instances"
  vpc_id      = module.vpc.vpc_id


  egress {
    description = "Salida sin restriccion, el agente ssm necesita 443"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

data "aws_iam_instance_profile" "ssm" {

  name = "Role-SSM"

}
