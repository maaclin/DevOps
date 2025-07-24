variable "vpc_id" {
  description = "VPC ID for Vault EC2 instance."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Vault EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Vault."
  type        = string
  default     = "t2.micro"
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for access."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "instance_name" {
  description = "Name tag for the Vault EC2 instance."
  type        = string
  default     = "vault-server"
}

variable "ssh" {
  description = "SSH port."
  type        = string
  default = "22"
}

variable "vault_port" {
  description = "Vault port."
  type        = string
  default = "8200"
}