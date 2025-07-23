
resource "aws_instance" "wordpress-ec2" {
  ami                    = var.wordpress-ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.key_name
  user_data              = file("${path.module}/cloud-init.sh")
  associate_public_ip_address = true
  tags = {
    Name = "WordPress-EC2"
  }
}