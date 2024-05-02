variable "region" {
  default = "eu-west-2"
}

variable "instance_ami" {
  default = "ami-0526fcd84e005ad06"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "mern-"
}

variable "aws_vpc" {
  default = ""
}