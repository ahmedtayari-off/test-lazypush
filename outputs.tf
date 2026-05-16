output "app_alb_id" {
  value = module.app_alb.id
}

output "app_alb_arn" {
  value = module.app_alb.arn
}

output "app_alb_dns_name" {
  value = module.app_alb.dns_name
}

output "app_alb_zone_id" {
  value = module.app_alb.zone_id
}

output "app_alb_target_groups" {
  value = module.app_alb.target_groups
}

output "app_service_cluster_arn" {
  value = module.app_service.cluster_arn
}

output "app_service_cluster_id" {
  value = module.app_service.cluster_id
}

output "app_service_cluster_name" {
  value = module.app_service.cluster_name
}

output "app_db_db_instance_endpoint" {
  value = module.app_db.db_instance_endpoint
}

output "app_db_db_instance_identifier" {
  value = module.app_db.db_instance_identifier
}

output "app_db_db_instance_port" {
  value = module.app_db.db_instance_port
}

output "app_db_db_subnet_group_id" {
  value = module.app_db.db_subnet_group_id
}

output "app_cache_replication_group_id" {
  value = module.app_cache.replication_group_id
}

output "app_cache_replication_group_primary_endpoint_address" {
  value = module.app_cache.replication_group_primary_endpoint_address
}

output "app_cache_replication_group_reader_endpoint_address" {
  value = module.app_cache.replication_group_reader_endpoint_address
}

output "app_assets_s3_bucket_id" {
  value = module.app_assets.s3_bucket_id
}

output "app_assets_s3_bucket_arn" {
  value = module.app_assets.s3_bucket_arn
}

output "app_assets_s3_bucket_region" {
  value = module.app_assets.s3_bucket_region
}

output "sg_alb_security_group_id" {
  value = module.sg_alb.security_group_id
}

output "sg_alb_security_group_arn" {
  value = module.sg_alb.security_group_arn
}

output "sg_ecs_security_group_id" {
  value = module.sg_ecs.security_group_id
}

output "sg_ecs_security_group_arn" {
  value = module.sg_ecs.security_group_arn
}

output "ecs_task_role_iam_role_arn" {
  value = module.ecs_task_role.iam_role_arn
}

output "ecs_task_role_iam_role_name" {
  value = module.ecs_task_role.iam_role_name
}

output "ecs_task_role_iam_role_unique_id" {
  value = module.ecs_task_role.iam_role_unique_id
}

output "ecs_task_role_iam_instance_profile_arn" {
  value = module.ecs_task_role.iam_instance_profile_arn
}

output "ecs_task_role_iam_instance_profile_name" {
  value = module.ecs_task_role.iam_instance_profile_name
}

output "sg_rds_security_group_id" {
  value = module.sg_rds.security_group_id
}

output "sg_rds_security_group_arn" {
  value = module.sg_rds.security_group_arn
}

output "sg_redis_security_group_id" {
  value = module.sg_redis.security_group_id
}

output "sg_redis_security_group_arn" {
  value = module.sg_redis.security_group_arn
}

output "main_vpc_vpc_id" {
  value = module.main_vpc.vpc_id
}

output "main_vpc_private_subnets" {
  value = module.main_vpc.private_subnets
}

output "main_vpc_public_subnets" {
  value = module.main_vpc.public_subnets
}

output "main_vpc_database_subnets" {
  value = module.main_vpc.database_subnets
}

output "main_vpc_database_subnet_group_name" {
  value = module.main_vpc.database_subnet_group_name
}

output "main_vpc_elasticache_subnets" {
  value = module.main_vpc.elasticache_subnets
}

output "main_vpc_elasticache_subnet_group_name" {
  value = module.main_vpc.elasticache_subnet_group_name
}
