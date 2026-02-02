/*
output "vpc_id" {

  value = aws_vpc.cmtr_vkkq9lu1_01_vpc.id
}

output "vpc_cidr" {

  value = aws_vpc.cmtr_vkkq9lu1_01_vpc.cidr_block
}

output "public_subnet_ids" {

  value = {
    id1 = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_a.id
    id2 = aws_subnet.cmtrvkkq9lu1_01_subnet_public_b.id
    id3 = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_c.id
  }
}

output "public_subnet_cidr_block" {

  value = {
    cidr1 = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_a.cidr_block
    cidr2 = aws_subnet.cmtrvkkq9lu1_01_subnet_public_b.cidr_block
    cidr3 = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_c.cidr_block
  }
}

output "public_subnet_availability_zone" {

  value = {
    zone1 = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_a.availability_zone
    zone2 = aws_subnet.cmtrvkkq9lu1_01_subnet_public_b.availability_zone
    zone3 = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_c.availability_zone
  }
}

output "internet_gateway_id" {

  value = aws_internet_gateway.cmtr_vkkq9lu1_01_igw.id
}

output "routing_table_id" {

  value = aws_route_table.cmtr_vkkq9lu1_01_rt.id
}


 */
output "load_balancer_dns_name" {
  value = aws_lb.cmtr_vkkq9lu1_loadbalancer.dns_name
}