/*
resource "aws_instance" "ec2_sdfaerg" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c94855ba95c71c99"
  vpc_security_group_ids = [data.terraform_remote_state.base_infra.outputs.security_group_id]
  subnet_id              = data.terraform_remote_state.base_infra.outputs.public_subnet_id
  tags = {
    Terraform = true
    Project   = "cmtr-vkkq9lu1"
  }
}




resource "aws_instance" "cmtr_vkkq9lu1_instance" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  subnet_id              = data.aws_subnet.by_name.id
  tags                   = { Name = "cmtr-vkkq9lu1-instance" }
}


 */