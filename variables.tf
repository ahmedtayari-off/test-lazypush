variable "app_alb_name" {
  type    = string
}

variable "app_alb_internal" {
  type    = string
}

variable "app_alb_load_balancer_type" {
  type    = string
}

variable "app_alb_target_groups" {
  type    = map(any)
}

variable "app_alb_tags" {
  type    = map(any)
}

variable "app_alb_listeners" {
  type    = map(any)
}

variable "app_service_cluster_name" {
  type    = string
}

variable "app_service_autoscaling_capacity_providers" {
  type    = map(any)
}

variable "app_service_fargate_capacity_providers" {
  type    = map(any)
}

variable "app_service_default_capacity_provider_use_fargate" {
  type    = string
}

variable "app_service_tags" {
  type    = map(any)
}

variable "app_db_family" {
  type    = string
}

variable "app_db_db_name" {
  type    = string
}

variable "app_db_multi_az" {
  type    = string
}

variable "app_db_username" {
  type    = string
}

variable "app_db_identifier" {
  type    = string
}

variable "app_db_engine_version" {
  type    = string
}

variable "app_db_instance_class" {
  type    = string
}

variable "app_db_allocated_storage" {
  type    = string
}

variable "app_db_deletion_protection" {
  type    = string
}

variable "app_db_skip_final_snapshot" {
  type    = string
}

variable "app_db_engine" {
  type    = string
}

variable "app_db_storage_encrypted" {
  type    = string
}

variable "app_db_tags" {
  type    = map(any)
}

variable "app_cache_node_type" {
  type    = string
}

variable "app_cache_engine_version" {
  type    = string
}

variable "app_cache_num_cache_clusters" {
  type    = string
}

variable "app_cache_replication_group_id" {
  type    = string
}

variable "app_cache_at_rest_encryption_enabled" {
  type    = string
}

variable "app_cache_tags" {
  type    = map(any)
}

variable "app_cache_engine" {
  type    = string
}

variable "app_cache_transit_encryption_enabled" {
  type    = string
}

variable "app_assets_bucket" {
  type    = string
}

variable "app_assets_versioning" {
  type    = map(any)
}

variable "app_assets_lifecycle_rule" {
  type    = list(any)
}

variable "app_assets_tags" {
  type    = map(any)
}

variable "app_assets_server_side_encryption_configuration" {
  type    = map(any)
}

variable "sg_alb_name" {
  type    = string
}

variable "sg_alb_description" {
  type    = string
}

variable "sg_alb_tags" {
  type    = map(any)
}

variable "sg_alb_ingress_with_cidr_blocks" {
  type    = list(any)
}

variable "sg_alb_egress_with_cidr_blocks" {
  type    = list(any)
}

variable "sg_ecs_name" {
  type    = string
}

variable "sg_ecs_description" {
  type    = string
}

variable "sg_ecs_tags" {
  type    = map(any)
}

variable "sg_ecs_ingress_with_source_security_group_id" {
  type    = list(any)
}

variable "sg_ecs_egress_with_cidr_blocks" {
  type    = list(any)
}

variable "ecs_task_role_role_name" {
  type    = string
}

variable "ecs_task_role_trusted_role_services" {
  type    = list(any)
}

variable "ecs_task_role_create_instance_profile" {
  type    = string
}

variable "ecs_task_role_custom_role_policy_arns" {
  type    = list(any)
}

variable "ecs_task_role_create_role" {
  type    = string
}

variable "ecs_task_role_role_requires_mfa" {
  type    = string
}

variable "ecs_task_role_tags" {
  type    = map(any)
}

variable "sg_rds_name" {
  type    = string
}

variable "sg_rds_description" {
  type    = string
}

variable "sg_rds_tags" {
  type    = map(any)
}

variable "sg_rds_ingress_with_source_security_group_id" {
  type    = list(any)
}

variable "sg_rds_egress_with_cidr_blocks" {
  type    = list(any)
}

variable "sg_redis_name" {
  type    = string
}

variable "sg_redis_description" {
  type    = string
}

variable "sg_redis_tags" {
  type    = map(any)
}

variable "sg_redis_ingress_with_source_security_group_id" {
  type    = list(any)
}

variable "sg_redis_egress_with_cidr_blocks" {
  type    = list(any)
}

variable "main_vpc_azs" {
  type    = list(any)
}

variable "main_vpc_cidr" {
  type    = string
}

variable "main_vpc_name" {
  type    = string
}

variable "main_vpc_public_subnets" {
  type    = list(any)
}

variable "main_vpc_private_subnets" {
  type    = list(any)
}

variable "main_vpc_database_subnets" {
  type    = list(any)
}

variable "main_vpc_enable_nat_gateway" {
  type    = string
}

variable "main_vpc_single_nat_gateway" {
  type    = string
}

variable "main_vpc_enable_dns_hostnames" {
  type    = string
}
