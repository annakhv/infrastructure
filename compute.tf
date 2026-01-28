resource "aws_instance" "ec2" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c94855ba95c71c99"
  vpc_security_group_ids = [data.terraform_remote_state.base_infra.outputs.security_group_id]
  subnet_id              = data.terraform_remote_state.base_infra.outputs.public_subnet_id
  tags = {
    terraform = true
    Project   = "cmtr-vkkq9lu1"
  }
}
