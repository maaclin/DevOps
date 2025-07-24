# WordPress with HashiCorp Vault Infrastructure

A Terraform project that deploys a functional WordPress application on AWS, using HashiCorp Vault to securely store and retrieve database credentials.

## Learning Outcomes

This project demonstrates:
- **Infrastructure as Code** with Terraform modules
- **Secret Management** with HashiCorp Vault
- **Cloud Infrastructure** design on AWS
- **Automation** with cloud-init scripts
- **Service Integration** between multiple components

## Architecture Overview

This project creates a simple infrastructure consisting of:

- **VPC Module**: Custom VPC with public subnet, internet gateway, and routing
- **Vault Module**: HashiCorp Vault server running in development mode
- **EC2 Module**: WordPress server with MySQL database on the same instance
- **Security**: All database credentials stored and retrieved from Vault

## 📋 Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform >= 1.0
- S3 bucket for Terraform state storage (`wordpress-coderco`)

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   ```

2. **Review and modify variables**
   ```bash
   # Edit terraform.tfvars if needed
   vim terraform.tfvars
   ```

3. **Initialize and deploy**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. **Access your WordPress site**
   ```bash
   # Get the WordPress public IP
   terraform output wordpress_public_ip
   
   # Open in browser
   http://<wordpress_public_ip>
   ```

## Project Structure

```
├── main.tf                    # Root module configuration
├── variables.tf               # Root module variables
├── outputs.tf                 # Root module outputs
├── terraform.tfvars           # Variable values
├── provider.tf                # AWS provider and backend config
├── modules/
│   ├── vpc/
│   │   ├── vpc.tf            # VPC, subnet, IGW, routing
│   │   ├── variables.tf      # VPC module variables
│   │   └── outputs.tf        # VPC module outputs
│   ├── vault/
│   │   ├── vault.tf          # Vault EC2 instance and security group
│   │   ├── variables.tf      # Vault module variables
│   │   ├── outputs.tf        # Vault module outputs
│   │   └── cloud-init-vault.sh  # Vault server setup script
│   └── ec2/
│       ├── ec2.tf            # WordPress EC2 instance and security group
│       ├── variables.tf      # EC2 module variables
│       ├── outputs.tf        # EC2 module outputs
│       └── cloud-init-wordpress.sh  # WordPress setup script
```

## 🔧 Technical Implementation

### Infrastructure Components

**VPC Configuration:**
- CIDR: `10.0.0.0/16`
- Public subnet: `10.0.1.0/24`
- Internet Gateway with public routing
- DNS hostnames and DNS support enabled

**Security Groups:**
- Vault: SSH (22) and Vault API (8200) access
- WordPress: SSH (22) and HTTP (80) access
- Both have full egress rules for internet access

**Compute Resources:**
- Instance type: `t2.micro` for both services
- AMI: Latest Ubuntu 20.04 LTS (automatically discovered using data module)
- Both instances get public IPs for easy access

### Vault Integration Workflow

1. **Vault Server Setup** (`cloud-init-vault.sh`):
   ```bash
   # Downloads and installs Vault 1.9.0
   # Starts Vault in development mode
   # Stores MySQL credentials in Vault at secret/mysql
   # Default dev token: 'root'
   ```

2. **WordPress Server Setup** (`cloud-init-wordpress.sh`):
   ```bash
   # Installs Apache, PHP, MySQL, and dependencies
   # Queries Vault API to retrieve database credentials
   # Creates MySQL database and user with Vault credentials
   # Configures WordPress wp-config.php with retrieved credentials
   # Sets proper permissions and starts services
   ```

## Security Considerations

**Current Security Model:**
- Vault runs in development mode (NOT production-ready)
- Security groups allow access from anywhere (0.0.0.0/0)
- Root token used for simplicity


**Production Improvements Needed:**
- Vault with proper storage backend
- Restrictive security group rules
- Vault authentication methods (not root token)
- Private subnets for database resources
- Application Load Balancer

