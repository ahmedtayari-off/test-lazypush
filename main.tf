terraform {
  required_version = "~> 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.30"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "ec2_instance" {
  source = "./modules/terraform-aws-ec2-instance"

  name = var.ec2_instance_name
  ami_ssm_parameter = var.ec2_instance_ami_ssm_parameter
  instance_type = var.ec2_instance_instance_type
  tags = var.ec2_instance_tags
  subnet_id = module.vpc.private_subnets[0]
  associate_public_ip_address = var.ec2_instance_associate_public_ip_address
  vpc_security_group_ids = [module.security_group.security_group_id]
}

module "security_group" {
  source = "./modules/terraform-aws-security-group"

  description = var.security_group_description
  tags = var.security_group_tags
  name = var.security_group_name
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "./modules/terraform-aws-vpc"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs = var.vpc_azs
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  private_subnets = var.vpc_private_subnets
  public_subnets = var.vpc_public_subnets
  database_subnets = var.vpc_database_subnets
  elasticache_subnets = var.vpc_elasticache_subnets
}