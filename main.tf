provider "aws" {
  region = var.region
}

resource "aws_instance" "myec2" {
  ami             = var.instance_ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.ak-sg.name]
  user_data       = file("install_apache.sh")

  tags = {
    Name = "ak-ec2"
  }
}

resource "aws_security_group" "ak-sg" {
  name        = "ak-sg"
  vpc_id      = var.aws_vpc
  description = "allow all traffic"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ak-tesgSG"
  }
}