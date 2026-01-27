/*

variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
}



 */

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

variable "internet_gateway_id" {
  description = "ID of the Internet Gateway attached to the VPC"
  type        = string
}

variable "nat_gateway_id" {
  description = "ID of the NAT Gateway used by private subnet"
  type        = string
}
