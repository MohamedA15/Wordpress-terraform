variable "Vpc_name" {
    type = string
    description = "The name of our VPC"
    default = "Wordpress-vpc"
}
  

variable "cidr_block" {
    type = string
    description = "This is the ip address range for our vpc"
    default = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones to use"
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# EC2 Variables
variable "ami_id" {
  type    = string
  description = "AMI ID for EC2 instance"
  default = "ami-046c2381f11878233"
}

variable "instance_type" {
  type    = string
  description = "EC2 instance type"
  default = "t2.micro"
}

# Security Group Variables (optional if you want to make rules dynamic)
variable "sg_name" {
  type    = string
  default = "Wordpress-sg"
}

variable "sg_description" {
  type    = string
  default = "Allow HTTPS access"
}

variable "ingress_rules" {
type = list(string)
description = "ingress rules"
default = ["http-80-tcp", "https-443-tcp", "ssh-tcp"] 
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "Allowed inbound CIDR blocks for SSH/HTTP/HTTPS"
  default     = ["161.12.75.226/32"]
}
