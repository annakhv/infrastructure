
/*

resource "aws_key_pair" "cmtr_vkkq9lu1_keypair" {
  public_key = var.ssh_key
  key_name   = "cmtr-vkkq9lu1-keypair"
  tags = {
    Project = "epam-tf-lab",
    ID      = "cmtr-vkkq9lu1"
  }
}

resource "aws_security_group" "cmtr_vkkq9lu1_sg" {
  vpc_id = aws_vpc.cmtr_vkkq9lu1_01_vpc.id
  name   = "cmtr-vkkq9lu1-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


 */