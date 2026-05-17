# Terraform variable values — edit before apply

# ec2_instance
ec2_instance_name = "ec2-instance"
ec2_instance_ami_ssm_parameter = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
ec2_instance_instance_type = "t3.micro"
ec2_instance_tags = {}
ec2_instance_associate_public_ip_address = false

# security_group
security_group_description = "Security Group managed by Terraform"
security_group_tags = {}
security_group_name = "Security-Group"

# vpc
vpc_name = "vpc"
vpc_cidr = "10.0.0.0/16"
vpc_azs = ["eu-west-1b", "us-east-1c"]
vpc_enable_nat_gateway = false
vpc_single_nat_gateway = false
vpc_enable_dns_hostnames = true
vpc_private_subnets = ["10.0.1.0/24"]
vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_database_subnets = ["10.0.201.0/24", "10.0.202.0/24"]
vpc_elasticache_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
