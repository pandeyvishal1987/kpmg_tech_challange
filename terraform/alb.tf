# Creating External LoadBalancer
resource "aws_lb" "external_alb" {
  name               = "external-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = module.app_vpc.public_subnets[*]
}
resource "aws_lb_target_group" "target_alb" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.app_vpc.vpc_id
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.target_alb.arn
  target_id        = aws_instance.webserver.id
  port             = 80
  depends_on = [
    aws_instance.webserver
  ]
}
# resource "aws_lb_target_group_attachment" "attachment" {
#   target_group_arn = aws_lb_target_group.external-alb.arn
#   target_id        = aws_instance.demoinstance1.id
#   port             = 80
#   depends_on = [
#     aws_instance.demoinstance1,
#   ]
# }
resource "aws_lb_listener" "external_elb" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_alb.arn
  }
}
