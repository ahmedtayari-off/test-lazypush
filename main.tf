terraform {
  required_version = "~> 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.47"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}


module "app_alb" {
  source = "./modules/terraform-aws-alb"

  name = var.app_alb_name
  internal = var.app_alb_internal
  load_balancer_type = var.app_alb_load_balancer_type
  security_groups = module.sg_alb.security_group_id
  target_groups = var.app_alb_target_groups
  tags = var.app_alb_tags
  listeners = var.app_alb_listeners
  vpc_id = module.main_vpc.vpc_id
  subnets = module.main_vpc.public_subnets
}

module "app_service" {
  source = "./modules/terraform-aws-ecs"

  cluster_name = var.app_service_cluster_name
  autoscaling_capacity_providers = var.app_service_autoscaling_capacity_providers
  fargate_capacity_providers = var.app_service_fargate_capacity_providers
  services = {
      app-service = {
      create_security_group = false
      create_iam_role = false
      create_task_exec_iam_role = false
      create_tasks_iam_role = false
      security_group_ids = [module.sg_ecs.security_group_id]
      task_exec_iam_role_arn = module.ecs_task_role.iam_role_arn
      subnet_ids = module.main_vpc.private_subnets
    }
    }
  default_capacity_provider_use_fargate = var.app_service_default_capacity_provider_use_fargate
  tags = var.app_service_tags
}

module "app_db" {
  source = "./modules/terraform-aws-rds"

  family = var.app_db_family
  db_name = var.app_db_db_name
  multi_az = var.app_db_multi_az
  username = var.app_db_username
  identifier = var.app_db_identifier
  engine_version = var.app_db_engine_version
  instance_class = var.app_db_instance_class
  allocated_storage = var.app_db_allocated_storage
  deletion_protection = var.app_db_deletion_protection
  skip_final_snapshot = var.app_db_skip_final_snapshot
  vpc_security_group_ids = module.sg_rds.security_group_id
  engine = var.app_db_engine
  subnet_ids = module.main_vpc.database_subnets
  storage_encrypted = var.app_db_storage_encrypted
  tags = var.app_db_tags
  db_subnet_group_name = module.main_vpc.database_subnet_group_name
}

module "app_cache" {
  source = "./modules/terraform-aws-elasticache"

  node_type = var.app_cache_node_type
  engine_version = var.app_cache_engine_version
  num_cache_clusters = var.app_cache_num_cache_clusters
  replication_group_id = var.app_cache_replication_group_id
  at_rest_encryption_enabled = var.app_cache_at_rest_encryption_enabled
  tags = var.app_cache_tags
  engine = var.app_cache_engine
  security_group_ids = module.sg_redis.security_group_id
  transit_encryption_enabled = var.app_cache_transit_encryption_enabled
  subnet_group_name = module.main_vpc.elasticache_subnet_group_name
}

module "app_assets" {
  source = "./modules/terraform-aws-s3-bucket"

  bucket = var.app_assets_bucket
  versioning = var.app_assets_versioning
  lifecycle_rule = var.app_assets_lifecycle_rule
  tags = var.app_assets_tags
  server_side_encryption_configuration = var.app_assets_server_side_encryption_configuration
}

module "sg_alb" {
  source = "./modules/terraform-aws-security-group"

  name = var.sg_alb_name
  description = var.sg_alb_description
  tags = var.sg_alb_tags
  ingress_with_cidr_blocks = var.sg_alb_ingress_with_cidr_blocks
  egress_with_cidr_blocks = var.sg_alb_egress_with_cidr_blocks
  vpc_id = module.main_vpc.vpc_id
}

module "sg_ecs" {
  source = "./modules/terraform-aws-security-group"

  name = var.sg_ecs_name
  description = var.sg_ecs_description
  tags = var.sg_ecs_tags
  ingress_with_source_security_group_id = var.sg_ecs_ingress_with_source_security_group_id
  egress_with_cidr_blocks = var.sg_ecs_egress_with_cidr_blocks
  vpc_id = module.main_vpc.vpc_id
}

module "ecs_task_role" {
  source = "./modules/terraform-aws-iam-role/modules/iam-assumable-role"

  role_name = var.ecs_task_role_role_name
  trusted_role_services = var.ecs_task_role_trusted_role_services
  create_instance_profile = var.ecs_task_role_create_instance_profile
  custom_role_policy_arns = var.ecs_task_role_custom_role_policy_arns
  create_role = var.ecs_task_role_create_role
  role_requires_mfa = var.ecs_task_role_role_requires_mfa
  tags = var.ecs_task_role_tags
}

module "sg_rds" {
  source = "./modules/terraform-aws-security-group"

  name = var.sg_rds_name
  description = var.sg_rds_description
  tags = var.sg_rds_tags
  ingress_with_source_security_group_id = var.sg_rds_ingress_with_source_security_group_id
  egress_with_cidr_blocks = var.sg_rds_egress_with_cidr_blocks
  vpc_id = module.main_vpc.vpc_id
}

module "sg_redis" {
  source = "./modules/terraform-aws-security-group"

  name = var.sg_redis_name
  description = var.sg_redis_description
  tags = var.sg_redis_tags
  ingress_with_source_security_group_id = var.sg_redis_ingress_with_source_security_group_id
  egress_with_cidr_blocks = var.sg_redis_egress_with_cidr_blocks
  vpc_id = module.main_vpc.vpc_id
}

module "main_vpc" {
  source = "./modules/terraform-aws-vpc"

  azs = var.main_vpc_azs
  cidr = var.main_vpc_cidr
  name = var.main_vpc_name
  public_subnets = var.main_vpc_public_subnets
  private_subnets = var.main_vpc_private_subnets
  database_subnets = var.main_vpc_database_subnets
  enable_nat_gateway = var.main_vpc_enable_nat_gateway
  single_nat_gateway = var.main_vpc_single_nat_gateway
  enable_dns_hostnames = var.main_vpc_enable_dns_hostnames
}