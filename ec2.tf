
/*
resource "aws_instance" "cmtr_vkkq9lu1_public_instance" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c94855ba95c71c99"
//  vpc_security_group_ids = [aws_security_group.cmtr_vkkq9lu1_sg.id]
  subnet_id              = aws_subnet.cmtr_vkkq9lu1_public_subnet.id
 // key_name               = aws_key_pair.cmtr_vkkq9lu1_keypair.key_name
  tags = { Name = "cmtr-vkkq9lu1-public-instance-0fb708bb1ddc43691",
    Project = "epam-tf-lab",
    ID      = "cmtr-vkkq9lu1"

  }
}


resource "aws_instance" "cmtr_vkkq9lu1_private_instance" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c94855ba95c71c99"
  //  vpc_security_group_ids = [aws_security_group.cmtr_vkkq9lu1_sg.id]
  subnet_id              = aws_subnet.cmtr_vkkq9lu1_private_subnet.id
  // key_name               = aws_key_pair.cmtr_vkkq9lu1_keypair.key_name
  tags = { Name = "cmtr-vkkq9lu1-public-instance-0b573583d02c5aa8f",
    Project = "epam-tf-lab",
    ID      = "cmtr-vkkq9lu1"

  }
}





 */