resource "aws_instance" "wordpress" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.wordpress.id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/cloud-init-wordpress.sh", {
    vault_addr = var.vault_addr
  })

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "wordpress" {
  name        = "wordpress-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.http
    to_port     = var.http
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
    from_port   = var.ssh
    to_port     = var.ssh
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}