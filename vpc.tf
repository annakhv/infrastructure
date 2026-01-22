terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_vpc" "cmtr-vkkq9lu1-01-vpc" {
  cidr_block = "10.10.0.0/16"
}


resource "aws_subnet" "cmtr-vkkq9lu1-01-subnet-public-a" {
  vpc_id            = aws_vpc.cmtr-vkkq9lu1-01-vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public"
  }
}


resource "aws_subnet" "cmtr-vkkq9lu1-01-subnet-public-b" {
  vpc_id            = aws_vpc.cmtr-vkkq9lu1-01-vpc.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public"
  }
}


resource "aws_subnet" "cmtr-vkkq9lu1-01-subnet-public-c" {
  vpc_id            = aws_vpc.cmtr-vkkq9lu1-01-vpc.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "public"
  }
}


resource "aws_internet_gateway" "cmtr-vkkq9lu1-01-igw" {
  vpc_id = aws_vpc.cmtr-vkkq9lu1-01-vpc.id
}

resource "aws_route_table" "cmtr-vkkq9lu1-01-rt" {
  vpc_id = aws_vpc.cmtr-vkkq9lu1-01-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cmtr-vkkq9lu1-01-igw.id
  }
}

resource "aws_route_table_association" "PublicRTAssociation_a" {
  subnet_id      = aws_subnet.cmtr-vkkq9lu1-01-subnet-public-a.id
  route_table_id = aws_route_table.cmtr-vkkq9lu1-01-rt.id
}

resource "aws_route_table_association" "PublicRTAssociation_b" {
  subnet_id      = aws_subnet.cmtr-vkkq9lu1-01-subnet-public-b.id
  route_table_id = aws_route_table.cmtr-vkkq9lu1-01-rt.id
}

resource "aws_route_table_association" "PublicRTAssociation_c" {
  subnet_id      = aws_subnet.cmtr-vkkq9lu1-01-subnet-public-c.id
  route_table_id = aws_route_table.cmtr-vkkq9lu1-01-rt.id
}
