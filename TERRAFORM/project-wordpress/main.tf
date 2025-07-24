
module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  vpc_name            = var.vpc_name
  az                  = var.az
}

module "vault" {
  source        = "./modules/vault"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
  instance_type = var.vault_instance_type
  instance_name = var.vault_instance_name
}

module "ec2" {
  source        = "./modules/ec2"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
  vault_addr    = module.vault.vault_addr
  instance_type = var.wordpress_instance_type
  instance_name = var.wordpress_instance_name
}