variable "vpc_id" {
  description = "VPC ID for WordPress EC2 instance."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for WordPress EC2 instance."
  type        = string
}

variable "vault_addr" {
  description = "Vault server address for secret retrieval."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for WordPress."
  type        = string
  default     = "t2.micro"
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for HTTP/SSH access."
  type        = list(string)
  default     = ["0.0.0.0/0"]
} 

variable "instance_name" {
  description = "Name tag for the WordPress EC2 instance."
  type        = string
  default     = "wordpress-server"
}

variable "ssh" {
  description = "SSH port."
  type        = string
  default = "22"
}

variable "http" {
  description = "http port."
  type        = string
  default = "80"
}