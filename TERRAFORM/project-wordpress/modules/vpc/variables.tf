variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc_name" {
  description = "Name tag for the VPC."
  type        = string
  default     = "my-vpc"
}

variable "az" {
  description = "Availability Zone for the public subnet."
  type        = string
  default     = "eu-west-2"
}