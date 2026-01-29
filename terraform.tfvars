vpc_name = "cmtr-vkkq9lu1-vpc"
vpc_cidr = "10.0.0.0/16"

public_subnet_cidr_a  = "10.0.1.0/24"
private_subnet_cidr_a = "10.0.2.0/24"
public_subnet_cidr_b  = "10.0.3.0/24"
private_subnet_cidr_b = "10.0.4.0/24"

ec2_ssh_sg_name  = "cmtr-vkkq9lu1-ec2_sg"
ec2_http_sg_name = "cmtr-vkkq9lu1-http_sg"
lb_http_sg_name  = "cmtr-vkkq9lu1-sglb"

iam_instance_profile_name = "cmtr-vkkq9lu1-instance_profile"
key_pair_name             = "cmtr-vkkq9lu1-keypair"

tags = {
  Terraform = true
  Project   = "cmtr-vkkq9lu1"
}

ami_id     = "ami-09e6f87a47903347c"
aws_region = "us-east-1"