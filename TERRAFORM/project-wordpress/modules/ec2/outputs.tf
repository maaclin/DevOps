output "public_ip" { 
  description = "Public IP address of the WordPress server."
  value = aws_instance.wordpress.public_ip
}

output "wordpress_sg_id" {
  value = aws_security_group.wordpress.id
} 