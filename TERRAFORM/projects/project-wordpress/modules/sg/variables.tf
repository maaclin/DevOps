
variable "sg-proto" {
  description = "Security group protocol"
  type        = string
  default     = "tcp"
}

variable "ssh" {
  description = "SSH port for security group"
  type        = number
  default     = 22
}

variable "http" {
  description = "HTTP port for security group"
  type        = number
  default     = 80
}

variable "https" {
  description = "HTTPS port for security group"
  type        = number
  default     = 443
}

variable "vpc_id" {
  type = string
}
