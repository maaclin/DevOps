output "vault_addr" {
  value = aws_instance.vault.public_ip
}

output "vault_sg_id" {
  value = aws_security_group.vault.id
} 