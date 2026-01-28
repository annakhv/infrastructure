
variable "aws_region" {
  description = "aws region for resources"
  type        = string
}

variable "project_id" {
  description = "project identifier for tagging"
  type        = string
}

variable "state_bucket" {
  description = "s3 bucket name for remote state"
  type        = string
}

variable "state_key" {
  description = "s3 key path for remote state file"
  type        = string
}

/*

variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
}





############################################
# Networking / Security
############################################

variable "allowed_ip_range" {
  description = "List of IP address ranges allowed to access the infrastructure (for SSH, HTTP, etc.)"
  type        = list(string)
}

############################################
# Existing Infrastructure IDs
############################################

variable "vpc_id" {
  description = "ID of the existing VPC where resources will be deployed"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "public_instance_id" {
  description = "ID of the public EC2 instance"
  type        = string
}

variable "private_instance_id" {
  description = "ID of the private EC2 instance"
  type        = string
}

variable "public_instance_eni_id" {
  description = "eni id of ec2 instance"
  type        = string
}

variable "private_instance_eni_id" {
  description = "eni id of ec2 instance"
  type        = string
}

 */
