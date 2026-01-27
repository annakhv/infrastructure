
resource "aws_security_group" "cmtr_vkkq9lu1_ssh_sg" {
  vpc_id = var.vpc_id
  name   = "cmtr-vkkq9lu1-ssh-sg"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    cidr_blocks = var.allowed_ip_range
    protocol    = "ICMP"

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "cmtr-vkkq9lu1-ssh-sg"
  Project = "cmtr-vkkq9lu1" }
}


resource "aws_security_group" "cmtr_vkkq9lu1_public_http_sg" {
  vpc_id = var.vpc_id
  name   = "cmtr-vkkq9lu1-public-http-sg"
  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    cidr_blocks = var.allowed_ip_range
    protocol    = "ICMP"

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "cmtr-vkkq9lu1-public-http-sg" }
}


resource "aws_security_group" "cmtr-vkkq9lu1-private-http-sg" {
  vpc_id = var.vpc_id
  name   = "cmtr-vkkq9lu1-private-http-sg"
  ingress {
    description     = "http"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.cmtr_vkkq9lu1_public_http_sg.id]
  }

  ingress {
    description     = "ICMP"
    from_port       = -1
    to_port         = -1
    security_groups = [aws_security_group.cmtr_vkkq9lu1_public_http_sg.id]
    protocol        = "ICMP"

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "cmtr-vkkq9lu1-private-http-sg"
  Project = "cmtr-vkkq9lu1" }
}


resource "aws_network_interface_sg_attachment" "cmtr_vkkq9lu1_public_instance" {
  network_interface_id = var.public_instance_eni_id
  security_group_id    = aws_security_group.cmtr_vkkq9lu1_public_http_sg.id
}


resource "aws_network_interface_sg_attachment" "cmtr_vkkq9lu1_private_instance" {
  network_interface_id = var.public_instance_eni_id
  security_group_id    = aws_security_group.cmtr-vkkq9lu1-private-http-sg.id
}
