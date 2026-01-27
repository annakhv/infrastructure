terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
/*
resource "aws_vpc" "cmtr_vkkq9lu1_vpc" {
  cidr_block = "10.10.0.0/16"
  tags       = { Name = "cmtr-vkkq9lu1-vpc-0383844d5f306a89a" }
}


resource "aws_subnet" "cmtr_vkkq9lu1_public_subnet" {
  vpc_id            = aws_vpc.cmtr_vkkq9lu1_vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "cmtr-vkkq9lu1-public-subnet-0573e974c4477317b"
  }
}


resource "aws_subnet" "cmtr_vkkq9lu1_private_subnet" {
  vpc_id            = aws_vpc.cmtr_vkkq9lu1_vpc.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "cmtr-vkkq9lu1-private-subnet-0573e974c4477317b"
  }
}


resource "aws_subnet" "cmtr_vkkq9lu1_01_subnet_public_c" {
  vpc_id            = aws_vpc.cmtr_vkkq9lu1_vpc.id
  cidr_block        = "10.10.5.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "cmtr-vkkq9lu1-01-subnet-public-c"
  }
}


resource "aws_internet_gateway" "cmtr_vkkq9lu1_01_igw" {
  vpc_id = aws_vpc.cmtr_vkkq9lu1_vpc.id
  tags = { Name = "cmtr-vkkq9lu1-01-igw"

  }
}

resource "aws_nat_gateway" "cmtr_vkkq9lu1_01_ngw" {
  vpc_id = aws_vpc.cmtr_vkkq9lu1_vpc.id
}

resource "aws_route_table" "cmtr_vkkq9lu1_01_rt" {
  vpc_id = aws_vpc.cmtr_vkkq9lu1_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cmtr_vkkq9lu1_01_igw.id
  }
  tags = { Name = "cmtr-vkkq9lu1-01-rt" }
}

resource "aws_route_table" "cmtr_vkkq9lu1_02_rt" {
  vpc_id = aws_vpc.cmtr_vkkq9lu1_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.cmtr_vkkq9lu1_01_ngw.id
  }
}

resource "aws_route_table_association" "PublicRTAssociation_a" {
  subnet_id      = aws_subnet.cmtr_vkkq9lu1_public_subnet
  route_table_id = aws_route_table.cmtr_vkkq9lu1_01_rt.id
}


resource "aws_route_table_association" "PublicRTAssociation_c" {
  subnet_id      = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_c.id
  route_table_id = aws_route_table.cmtr_vkkq9lu1_01_rt.id
}

resource "aws_route_table_association" "privatRTAssociation" {
  subnet_id      = aws_subnet.cmtr_vkkq9lu1_private_subnet.id
  route_table_id = aws_route_table.cmtr_vkkq9lu1_02_rt.id
}


 */