data "aws_security_group" "sg" {
  name = "cmtr-vkkq9lu1-sglb"
}


resource "aws_launch_template" "cmtr_vkkq9lu1_template" {
  name                 = "cmtr-vkkq9lu1-template"
  instance_type        = "t3.micro"
  security_group_names = [var.ec2_http_sg_name, var.ec2_ssh_sg_name]
  network_interfaces { delete_on_termination = "true" }
  key_name  = var.key_pair_name
  user_data = base64encode(file("user_data.sh"))
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
    var.private_subnet_cidr_a,
    var.private_subnet_cidr_b
  ]
}

resource "aws_alb" "cmtr_vkkq9lu1_loadbalancer" {
  name               = "cmtr-vkkq9lu1-loadbalancer"
  security_groups    = [data.aws_security_group.sg.id]
  internal           = false
  load_balancer_type = "application"
  subnets            = [var.public_subnet_cidr_a, var.public_subnet_cidr_b]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_alb.cmtr_vkkq9lu1_loadbalancer.arn
  protocol          = "HTTP"
  port              = 80
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "OK"
      status_code  = "200"
    }
  }
}

resource "aws_autoscaling_attachment" "aws_autoscaling_attachment" {
  autoscaling_group_name = "aws_autoscaling_attachment"
  lb_target_group_arn    = aws_alb.cmtr_vkkq9lu1_loadbalancer.arn
}
