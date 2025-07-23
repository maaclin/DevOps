
module "vpc" {
  source   = "./modules/vpc"
  vpc-cidr = "10.0.0.0/16"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  subnet_id     = module.vpc.public_subnet_id
  sg_id         = module.sg.sg_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

