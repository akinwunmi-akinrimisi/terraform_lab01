resource "aws_lb" "lb-internet-facing" {
  name               = "lb-internet-facing"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [aws_subnet.my_public_subnet01.id, aws_subnet.my_public_subnet02.id]


  tags = {
    Environment = "production"
  }
}
