output "ec2_instance_id" {
  value = module.ec2_instance.id
}

output "ec2_instance_private_ip" {
  value = module.ec2_instance.private_ip
}

output "ec2_instance_public_ip" {
  value = module.ec2_instance.public_ip
}

output "ec2_instance_iam_instance_profile_arn" {
  value = module.ec2_instance.iam_instance_profile_arn
}

output "security_group_security_group_id" {
  value = module.security_group.security_group_id
}

output "security_group_security_group_arn" {
  value = module.security_group.security_group_arn
}

output "vpc_vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_private_subnets" {
  value = module.vpc.private_subnets
}

output "vpc_public_subnets" {
  value = module.vpc.public_subnets
}

output "vpc_database_subnets" {
  value = module.vpc.database_subnets
}

output "vpc_database_subnet_group_name" {
  value = module.vpc.database_subnet_group_name
}

output "vpc_elasticache_subnets" {
  value = module.vpc.elasticache_subnets
}

output "vpc_elasticache_subnet_group_name" {
  value = module.vpc.elasticache_subnet_group_name
}
