
variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}


variable "key_name" {
  description = "Key pair name for SSH access to the EC2 instance"
  default     = "coderco"
}
