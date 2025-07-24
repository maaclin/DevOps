#!/bin/bash

# Update system and install dependencies
apt update -y
apt install -y unzip curl jq

# Download and install Vault
wget https://releases.hashicorp.com/vault/1.9.0/vault_1.9.0_linux_amd64.zip
unzip vault_1.9.0_linux_amd64.zip
mv vault /usr/local/bin/
chmod +x /usr/local/bin/vault

# Start Vault in dev mode (auto-unsealed, in-memory storage)
nohup vault server -dev -dev-listen-address=0.0.0.0:8200 > /var/log/vault.log 2>&1 &

# Wait for Vault to start
sleep 10

# Set Vault address and root token (dev mode uses 'root' as default token)
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

# Store MySQL credentials in Vault
vault kv put secret/mysql \
  username=wpuser \
  password=wp_secure_pass_123

echo "Vault setup complete!"