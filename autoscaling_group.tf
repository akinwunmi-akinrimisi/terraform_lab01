
resource "aws_autoscaling_group" "myautogroup" {
  vpc_zone_identifier       = [aws_subnet.my_public_subnet01.id, aws_subnet.my_public_subnet02.id]
  desired_capacity          = 3
  max_size                  = 4
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = [aws_lb_target_group.lb-target-group.arn]

  launch_template {
    id      = aws_launch_template.mylaunchtemp.id
    version = "$Latest"
  }
}
