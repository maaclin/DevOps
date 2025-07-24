# WordPress variables
variable "wordpress_instance_type" {
  type        = string
}

variable "wordpress_instance_name" {
  type        = string
}

# VPC variables 
variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "az" {
  type = string
}

# Vault variables
variable "vault_instance_name" {
  type = string
}

variable "vault_instance_type" {
  type = string
}