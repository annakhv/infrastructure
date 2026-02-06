data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = ["cmtr-vkkq9lu1-vpc"]
  }
}
data "aws_subnet" "public_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["cmtr-vkkq9lu1-public-subnet1"]
  }
}

data "aws_subnet" "public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["cmtr-vkkq9lu1-public-subnet2"]
  }
}
data "aws_security_group" "ssh" {
  filter {
    name   = "group-name"
    values = ["cmtr-vkkq9lu1-sg-ssh"]
  }

  vpc_id = data.aws_vpc.main.id
}
data "aws_security_group" "http" {
  filter {
    name   = "group-name"
    values = ["cmtr-vkkq9lu1-sg-http"]
  }

  vpc_id = data.aws_vpc.main.id
}
data "aws_security_group" "lb" {
  filter {
    name   = "group-name"
    values = ["cmtr-vkkq9lu1-sg-lb"]
  }

  vpc_id = data.aws_vpc.main.id
}

resource "aws_lb" "cmtr_vkkq9lu1_lb" {
  name = "cmtr-vkkq9lu1-lb"
  subnets = [
    data.aws_subnet.public_subnet_1.id,
    data.aws_subnet.public_subnet_2.id
  ]

  security_groups = [
    data.aws_security_group.lb.id
  ]
}

resource "aws_lb_target_group" "tg_blue" {
  name     = "cmtr-vkkq9lu1-blue-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group" "tg_green" {
  name     = "cmtr-vkkq9lu1-green-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.cmtr_vkkq9lu1_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.tg_blue.arn
        weight = var.blue_weight

      }

      target_group {
        arn    = aws_lb_target_group.tg_green.arn
        weight = var.green_weight
      }

    }
  }
}


resource "aws_launch_template" "cmtr_vkkq9lu1_blue_template" {
  name                   = "cmtr-vkkq9lu1-blue-template"
  instance_type          = "t3.micro"
  image_id               = "ami-09e6f87a47903347c"
  vpc_security_group_ids = [data.aws_security_group.http.id, data.aws_security_group.ssh.id]
  user_data              = base64encode(file("blue.sh"))
}

resource "aws_launch_template" "cmtr_vkkq9lu1_green_template" {
  name                   = "cmtr-vkkq9lu1-green-template"
  instance_type          = "t3.micro"
  image_id               = "ami-09e6f87a47903347c"
  vpc_security_group_ids = [data.aws_security_group.http.id, data.aws_security_group.ssh.id]
  user_data              = base64encode(file("green.sh"))
}

resource "aws_autoscaling_group" "ag_blue" {
  max_size         = 2
  min_size         = 1
  desired_capacity = 2
  vpc_zone_identifier = [
    data.aws_subnet.public_subnet_1.id,
    data.aws_subnet.public_subnet_2.id
  ]
  lifecycle { ignore_changes = [load_balancers, target_group_arns] }
  launch_template { id = aws_launch_template.cmtr_vkkq9lu1_blue_template.id }
}

resource "aws_autoscaling_group" "ag_green" {
  max_size         = 2
  min_size         = 1
  desired_capacity = 2
  vpc_zone_identifier = [
    data.aws_subnet.public_subnet_1.id,
    data.aws_subnet.public_subnet_2.id
  ]
  lifecycle { ignore_changes = [load_balancers, target_group_arns] }
  launch_template { id = aws_launch_template.cmtr_vkkq9lu1_green_template.id }
}

resource "aws_autoscaling_attachment" "associate_blue" {
  autoscaling_group_name = aws_autoscaling_group.ag_blue.name
  lb_target_group_arn    = aws_lb_target_group.tg_blue.arn
}

resource "aws_autoscaling_attachment" "associate_green" {
  autoscaling_group_name = aws_autoscaling_group.ag_green.name
  lb_target_group_arn    = aws_lb_target_group.tg_green.arn
}
