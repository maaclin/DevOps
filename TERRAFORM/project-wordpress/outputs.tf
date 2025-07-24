output "vault_addr" {
  description = "Vault server address."
  value       = module.vault.vault_addr
}

output "wordpress_public_ip" {
  description = "Public IP address of the WordPress server."
  value = module.ec2.public_ip
}
