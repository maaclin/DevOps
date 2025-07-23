
variable "vpc-cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet-cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ig-cidr" {
  description = "CIDR block for the Internet Gateway routes"
  type        = string
  default     = "0.0.0.0/0"
}