variable "profile" {
    type = string
    default = "default"
}

variable "region" {
    description = "Region which is used in this project"
    type = string
    default = "us-east-1"
}

variable "vpc_cidr_block" {
    description = "VPC CIDR Block"
    type = string
    default = "10.0.0.0/16"
}

variable "instance_tenancy" {
    description = "Instance Tenancy"
    type = string
    default = "default"
}

variable "public_subnet_1_cidr_block" {
    description = "CIDR Block for Public Subnet 1"
    type = string
    default = "10.0.0.0/24"
}

variable "public_subnet_1_availability_zone" {
    description = "Availability zone for Public Subnet 1"
    type = string
    default = "us-east-1a"
}

variable "private_subnet_1_cidr_block" {
    description = "CIDR Block for Private Subnet 1"
    type = string
    default = "10.0.2.0/24"
}

variable "private_subnet_1_availability_zone" {
    description = "Availability zone for Private Subnet 1"
    type = string
    default = "us-east-1a"
}

variable "public_map_public_ip_on_launch" {
    type = bool
    default = true
}

variable "private_map_public_ip_on_launch" {
    type = bool
    default = false
}

variable "route_table_cidr_block" {
    description = "Route table CIDR Block"
    type = string
    default = "0.0.0.0/0"
}

variable "security_group_name" {
    description = "Security Group Name"
    type = string
    default = "sg"
}

variable "security_group_description" {
    description = "Security Group Description"
    type = string
    default = "Allow SSH and HTTP inbound traffic"
}

variable "ec2_ingress_ports_default" {
  description = "Allowed EC2 ports"
  type        = list
  default     = {
    "22"  = ["0.0.0.0/0"]
    "80" = ["0.0.0.0/0"]
    "8080" = ["0.0.0.0/0"]
 }
}

variable "ami_instance" {
    description = "AMI"
    type = string
    default = "ami-04505e74c0741db8d"
}

variable "inst_type" {
    description = "Instance type"
    type = string
    default = "t2.micro"
}

variable "key" {
    description = "Key name"
    type = string
    default = "firstdemokey"
}

variable "availability_zone_instance" {
    description = "Availability zone for instnce"
    type = string
    default = "us-east-1a"
}

variable "port_zero" {
    type = number
    default = 0
}

variable "port_minus_one" {
    type = number
    default = -1
}

variable "protocol_tcp" {
    type = string
    default = "tcp" 
}

variable "protocol_icmp" {
    description = "Ping"
    type = string
    default = "icmp" 
}

variable "protocol_minus_one" {
    type = string
    default = "-1" 
}
