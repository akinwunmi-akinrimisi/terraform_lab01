
resource "aws_launch_template" "mylaunchtemp" {
  name = "mylaunchtemp"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }


  image_id               = data.aws_ssm_parameter.instance_ami.value
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ak-sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }


  user_data = filebase64("install_apache.sh")

}