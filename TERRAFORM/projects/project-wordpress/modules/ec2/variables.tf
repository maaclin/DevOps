
variable "wordpress-ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-00fefe800bd08f8da"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access to the EC2 instance"
  default     = "coderco"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "sg_id" {
  description = "Security Group ID for the EC2 instance"
  type        = string
}