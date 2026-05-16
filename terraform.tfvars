# Terraform variable values — edit before applying

# app_alb
app_alb_name = "app-alb"
app_alb_internal = "false"
app_alb_listeners = {}
app_alb_tags = {}
app_alb_target_groups = {}
app_alb_load_balancer_type = "application"

# app_service
app_service_cluster_name = "app-cluster"
app_service_tags = {}
app_service_fargate_capacity_providers = {}
app_service_default_capacity_provider_use_fargate = "true"
app_service_autoscaling_capacity_providers = {}

# app_db
app_db_family = "postgres15"
app_db_db_name = "appdb"
app_db_multi_az = "true"
app_db_username = "appuser"
app_db_identifier = "app-db"
app_db_engine_version = "15"
app_db_instance_class = "db.t3.medium"
app_db_allocated_storage = "50"
app_db_deletion_protection = "true"
app_db_skip_final_snapshot = "false"
app_db_tags = {}
app_db_storage_encrypted = "true"
app_db_engine = "postgres"

# app_cache
app_cache_node_type = "cache.t3.micro"
app_cache_engine_version = "7.0"
app_cache_num_cache_clusters = "2"
app_cache_replication_group_id = "app-cache"
app_cache_tags = {}
app_cache_transit_encryption_enabled = "true"
app_cache_engine = "redis"
app_cache_at_rest_encryption_enabled = "true"

# app_assets
app_assets_bucket = "app-assets-prod"
app_assets_lifecycle_rule = []
app_assets_server_side_encryption_configuration = {}
app_assets_tags = {}
app_assets_versioning = {}

# sg_alb
sg_alb_name = "alb"
sg_alb_description = "Allow inbound HTTP/HTTPS from the internet"
sg_alb_tags = {}
sg_alb_ingress_with_cidr_blocks = [{
      protocol = "tcp"
      from_port = "80"
      to_port = "80"
      cidr_blocks = "0.0.0.0/0"
    }, {
      protocol = "tcp"
      from_port = "443"
      to_port = "443"
      cidr_blocks = "0.0.0.0/0"
    }]
sg_alb_egress_with_cidr_blocks = [{
      protocol = "-1"
      from_port = "0"
      to_port = "0"
      cidr_blocks = "0.0.0.0/0"
    }]

# sg_ecs
sg_ecs_name = "ecs"
sg_ecs_description = "Allow traffic from ALB only"
sg_ecs_tags = {}
sg_ecs_ingress_with_source_security_group_id = [{
      protocol = "tcp"
      from_port = "3000"
      to_port = "3000"
      source_security_group_id = "sg-alb"
    }]
sg_ecs_egress_with_cidr_blocks = [{
      protocol = "-1"
      from_port = "0"
      to_port = "0"
      cidr_blocks = "0.0.0.0/0"
    }]

# ecs_task_role
ecs_task_role_role_name = "app-ecs-task-role"
ecs_task_role_trusted_role_services = ["ecs-tasks.amazonaws.com"]
ecs_task_role_create_instance_profile = "false"
ecs_task_role_custom_role_policy_arns = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
ecs_task_role_create_role = "true"
ecs_task_role_tags = {}
ecs_task_role_role_requires_mfa = "false"

# sg_rds
sg_rds_name = "rds"
sg_rds_description = "Allow PostgreSQL from ECS only"
sg_rds_tags = {}
sg_rds_ingress_with_source_security_group_id = [{
      protocol = "tcp"
      from_port = "5432"
      to_port = "5432"
      source_security_group_id = "sg-ecs"
    }]
sg_rds_egress_with_cidr_blocks = [{
      protocol = "-1"
      from_port = "0"
      to_port = "0"
      cidr_blocks = "0.0.0.0/0"
    }]

# sg_redis
sg_redis_name = "redis"
sg_redis_description = "Allow Redis from ECS only"
sg_redis_tags = {}
sg_redis_ingress_with_source_security_group_id = [{
      protocol = "tcp"
      from_port = "6379"
      to_port = "6379"
      source_security_group_id = "sg-ecs"
    }]
sg_redis_egress_with_cidr_blocks = [{
      protocol = "-1"
      from_port = "0"
      to_port = "0"
      cidr_blocks = "0.0.0.0/0"
    }]

# main_vpc
main_vpc_azs = ["eu-west-1a", "eu-west-1b"]
main_vpc_cidr = "10.0.0.0/16"
main_vpc_name = "main-vpc"
main_vpc_public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
main_vpc_private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
main_vpc_database_subnets = ["10.0.21.0/24", "10.0.22.0/24"]
main_vpc_enable_nat_gateway = "true"
main_vpc_single_nat_gateway = "true"
main_vpc_enable_dns_hostnames = "true"
