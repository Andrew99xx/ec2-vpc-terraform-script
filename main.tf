module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
}

module "networking" {
  source               = "./modules/networking"
  vpc_id               = module.vpc.vpc_id
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "ec2" {
  source                = "./modules/ec2"
  instance_count = var.instance_count  # 👈 pass from root
  public_subnet_ids     = module.networking.public_subnet_ids
  vpc_id                = module.vpc.vpc_id
  instance_type         = var.instance_type
  vpc_name              = var.vpc_name
  public_sg_id          = module.networking.public_sg_id
}
