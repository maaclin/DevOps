
output "instance_type" {
  value = var.instance_type
}

output "key_name" {
  value = var.key_name
}

output "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  value       = var.subnet_id
}

output "wordpress-ami" {
  description = "AMI ID for the EC2 instance"
  value       = var.wordpress-ami
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.wordpress-ec2.public_ip
}

output "instance_id" {
  description = "Instance ID of the EC2 instance"
  value       = aws_instance.wordpress-ec2.id
}