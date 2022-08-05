terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "VPC"
  }
}

resource "aws_subnet" "public-subnet-1" {

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_1_cidr_block
  map_public_ip_on_launch = var.public_map_public_ip_on_launch
  availability_zone       = var.public_subnet_1_availability_zone

  tags      = {
    Name    = "Public Subnet"
  }
}

resource "aws_subnet" "private-subnet-1" {

  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_subnet_1_cidr_block
  map_public_ip_on_launch  = var.private_map_public_ip_on_launch
  availability_zone        = var.private_subnet_1_availability_zone

  tags      = {
    Name    = "Private Subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Gateway"
  }
}

resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }
tags = {
    Name = "Default route table"
  }
}

resource "aws_security_group" "sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.vpc.id


  dynamic ingress {
    for_each = var.ec2_ingress_ports_default
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = var.protocol_tcp
    }
  }

  ingress {  
    protocol    = var.protocol_icmp
    self        = true
    from_port   = var.port_minus_one
    to_port     = var.port_minus_one
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.port_zero
    to_port     = var.port_zero
    protocol    = var.protocol_minus_one
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Group"
  }

}

resource "aws_instance" "jenkins-server" {
  ami           = var.ami_instance
  instance_type = var.inst_type
  key_name   = var.key
  availability_zone = var.availability_zone_instance
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.public-subnet-1.id

  user_data = "${file("install_jenkins_and_docker.sh")}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.jenkins-server.public_ip} >> IP_address.txt"
  }
    
  tags = {
    Name = "Jenkins server"
  }
}

resource "aws_instance" "app-server" {
  ami           = var.ami_instance
  instance_type = var.inst_type
  key_name   = var.key
  availability_zone = var.availability_zone_instance
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.public-subnet-1.id

  user_data = "${file("install_docker.sh")}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.app-server.public_ip} >> IP_address.txt"
  }

  tags = {
    Name = "Application server"
  }
}
