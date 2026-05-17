variable "ec2_instance_name" {
  type    = string
}

variable "ec2_instance_ami_ssm_parameter" {
  type    = string
}

variable "ec2_instance_instance_type" {
  type    = string
}

variable "ec2_instance_tags" {
  type    = map(string)
}

variable "ec2_instance_associate_public_ip_address" {
  type    = bool
}

variable "security_group_description" {
  type    = string
}

variable "security_group_tags" {
  type    = map(string)
}

variable "security_group_name" {
  type    = string
}

variable "vpc_name" {
  type    = string
}

variable "vpc_cidr" {
  type    = string
}

variable "vpc_azs" {
  type    = list(any)
}

variable "vpc_enable_nat_gateway" {
  type    = bool
}

variable "vpc_single_nat_gateway" {
  type    = bool
}

variable "vpc_enable_dns_hostnames" {
  type    = bool
}

variable "vpc_private_subnets" {
  type    = list(any)
}

variable "vpc_public_subnets" {
  type    = list(any)
}

variable "vpc_database_subnets" {
  type    = list(any)
}

variable "vpc_elasticache_subnets" {
  type    = list(any)
}
