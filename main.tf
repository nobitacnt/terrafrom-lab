resource "aws_key_pair" "study-keypair" {
  public_key = file(var.keypair_path)
  key_name = var.keypair_name
}

module "networking" {
  source = "./modules/networking"
  cidr_block = var.cidr_block
  cidr_block_public_subnets = var.cidr_block_public_subnets
  cidr_block_private_subnets = var.cidr_block_private_subnets
  zones = var.zones
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.networking.public_subnet_ids[0]
  instance_tag_name = var.instance_tag_name
  region = var.region
  instance_type = var.instance_type
  ami = var.image_ids[var.region]
  key_name = aws_key_pair.study-keypair.key_name
  ecs_security_group_ids = [module.security.public_security_group_id]
}

