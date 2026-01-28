terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_vpc" "cmtr_vkkq9lu1_01_vpc" {
  cidr_block = "10.10.0.0/16"
  tags       = { Name = "cmtr-vkkq9lu1-01-vpc" }
}


resource "aws_subnet" "cmtr_vkkq9lu1_01_subnet_public_a" {
  vpc_id            = aws_vpc.cmtr_vkkq9lu1_01_vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "cmtr-vkkq9lu1-01-subnet-public-a "
  }
}


resource "aws_subnet" "cmtrvkkq9lu1_01_subnet_public_b" {
  vpc_id            = aws_vpc.cmtr_vkkq9lu1_01_vpc.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "cmtr-vkkq9lu1-01-subnet-public-b"
  }
}


resource "aws_subnet" "cmtr_vkkq9lu1_01_subnet_public_c" {
  vpc_id            = aws_vpc.cmtr_vkkq9lu1_01_vpc.id
  cidr_block        = "10.10.5.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "cmtr-vkkq9lu1-01-subnet-public-c "
  }
}


resource "aws_internet_gateway" "cmtr_vkkq9lu1_01_igw" {
  vpc_id = aws_vpc.cmtr_vkkq9lu1_01_vpc.id
  tags = { Name = "cmtr-vkkq9lu1-01-igw"

  }
}



resource "aws_route_table" "cmtr_vkkq9lu1_01_rt" {
  vpc_id = aws_vpc.cmtr_vkkq9lu1_01_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cmtr_vkkq9lu1_01_igw.id
  }
  tags = { Name = "cmtr-vkkq9lu1-01-rt" }
}


resource "aws_route_table_association" "PublicRTAssociation_a" {
  subnet_id      = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_a.id
  route_table_id = aws_route_table.cmtr_vkkq9lu1_01_rt.id
}


resource "aws_route_table_association" "PublicRTAssociation_c" {
  subnet_id      = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_c.id
  route_table_id = aws_route_table.cmtr_vkkq9lu1_01_rt.id
}

resource "aws_route_table_association" "PublicRTAssociation_b" {
  subnet_id      = aws_subnet.cmtrvkkq9lu1_01_subnet_public_b.id
  route_table_id = aws_route_table.cmtr_vkkq9lu1_01_rt.id
}


