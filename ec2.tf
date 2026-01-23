
resource "aws_instance" "cmtr_vkkq9lu1_ec2" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c94855ba95c71c99"
  vpc_security_group_ids = [aws_security_group.cmtr_vkkq9lu1_sg.id]
  subnet_id              = aws_subnet.cmtr_vkkq9lu1_01_subnet_public_c.id
  key_name               = aws_key_pair.cmtr_vkkq9lu1_keypair.key_name
  tags = { Name = "cmtr-vkkq9lu1-ec2",
    Project = "epam-tf-lab",
    ID      = "cmtr-vkkq9lu1"

  }
}
