
/*
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "project_id" {
  description = "project identifier for tagging"
  type        = string
}

variable "public_subnet_name" {
  description = "name of public subnet to discover"
  type        = string
}

variable "security_group_name" {
  description = "name of security group to discover"
  type        = string
}



 */

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_a" {
  description = "CIDR block for public subnet in Availability Zone A"
  type        = string
}

variable "private_subnet_cidr_a" {
  description = "CIDR block for private subnet in Availability Zone A"
  type        = string
}

variable "public_subnet_cidr_b" {
  description = "CIDR block for public subnet in Availability Zone B"
  type        = string
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for private subnet in Availability Zone B"
  type        = string
}

variable "ec2_ssh_sg_name" {
  description = "Security group name allowing SSH access to EC2 instances"
  type        = string
}

variable "ec2_http_sg_name" {
  description = "Security group name allowing HTTP access to EC2 instances"
  type        = string
}

variable "lb_http_sg_name" {
  description = "Security group name allowing HTTP access to the Load Balancer"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile attached to EC2 instances"
  type        = string
}

variable "key_pair_name" {
  description = "EC2 Key Pair name for SSH access"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}

variable "ami_id" {
  description = "amazon machine image id"
  type        = string
}

variable "aws_region" {
  description = "aws region"
  type        = string
}


