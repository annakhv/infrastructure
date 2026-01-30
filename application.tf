data "aws_vpc" "cmtr_vkkq9lu1_vpc" {
  tags = {
    Name = "cmtr-vkkq9lu1-vpc"
  }
}

data "aws_security_group" "sg" {
  name = "cmtr-vkkq9lu1-sglb"
}

data "aws_security_group" "sg_http" {
  name = var.ec2_http_sg_name
}

data "aws_security_group" "sg_ssh" {
  name = var.ec2_ssh_sg_name
}
data "aws_subnet" "public_a" {
  filter {
    name   = "cidr-block"
    values = ["10.0.1.0/24"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.cmtr_vkkq9lu1_vpc.id]
  }
}

data "aws_subnet" "private_a" {
  filter {
    name   = "cidr-block"
    values = ["10.0.2.0/24"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.cmtr_vkkq9lu1_vpc.id]
  }
}

data "aws_subnet" "public_b" {
  filter {
    name   = "cidr-block"
    values = ["10.0.3.0/24"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.cmtr_vkkq9lu1_vpc.id]
  }
}

data "aws_subnet" "private_b" {
  filter {
    name   = "cidr-block"
    values = ["10.0.4.0/24"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.cmtr_vkkq9lu1_vpc.id]
  }
}

resource "aws_launch_template" "cmtr_vkkq9lu1_template" {
  name                   = "cmtr-vkkq9lu1-template"
  instance_type          = "t3.micro"
  image_id = "ami-09e6f87a47903347c"
  vpc_security_group_ids = [data.aws_security_group.sg_http.id, data.aws_security_group.sg_ssh.id]
  key_name               = var.key_pair_name
  user_data              = base64encode(file("user_data.sh"))
  iam_instance_profile {
    name = "cmtr-vkkq9lu1-instance_profile"
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }
  tags = var.tags

}

resource "aws_autoscaling_group" "cmtr_vkkq9lu1_asg" {
  name             = "cmtr-vkkq9lu1-asg"
  max_size         = 2
  min_size         = 1
  desired_capacity = 2
  lifecycle { ignore_changes = [load_balancers, target_group_arns] }
  launch_template { id = aws_launch_template.cmtr_vkkq9lu1_template.id }
  vpc_zone_identifier = [
    data.aws_subnet.private_a.id,
    data.aws_subnet.private_b.id
  ]

}

resource "aws_lb" "cmtr_vkkq9lu1_loadbalancer" {
  name               = "cmtr-vkkq9lu1-loadbalancer"
  security_groups    = [data.aws_security_group.sg.id]
  internal           = false
  load_balancer_type = "application"
  subnets            = [data.aws_subnet.public_a.id, data.aws_subnet.public_b.id]
}


resource "aws_lb_target_group" "cmtr_tg" {
  name     = "cmtr-vkkq9lu1-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.cmtr_vkkq9lu1_vpc.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.cmtr_vkkq9lu1_loadbalancer.arn
  protocol          = "HTTP"
  port              = 80
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cmtr_tg.arn
  }
}

resource "aws_autoscaling_attachment" "aws_autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.cmtr_vkkq9lu1_asg.name
  lb_target_group_arn    = aws_lb_target_group.cmtr_tg.arn
  depends_on = [
    aws_lb.cmtr_vkkq9lu1_loadbalancer,
    aws_lb_target_group.cmtr_tg
  ]
}
