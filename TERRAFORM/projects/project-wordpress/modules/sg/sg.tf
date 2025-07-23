# modules/sg/sg.tf
resource "aws_security_group" "public_sg" {
  name        = "public-sg"
  description = "Security group for public subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.https
    to_port     = var.https
    protocol    = var.sg-proto
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS access from anywhere"
  }

  ingress {
    from_port   = var.http
    to_port     = var.http
    protocol    = var.sg-proto
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access from anywhere"
  }

  ingress {
    from_port   = var.ssh
    to_port     = var.ssh
    protocol    = var.sg-proto
    cidr_blocks = ["0.0.0.0/0"] # Consider restricting this to your IP
    description = "SSH access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound traffic"
  }

  tags = {
    Name = "wordpress-public-sg"
  }
}