import {
  id = "i-0efd1c11cd21dff8d"
  to = aws_instance.my_existing_instance
}

resource "aws_instance" "my_existing_instance" {
  ami = "ami-02167eae61967e403"
  instance_type = "t3.micro"
  key_name = "terra-key"
  tags = {
    Name = "Terraform-Practice"
  }
}

resource "aws_ec2_instance_state" "my_existing_instance_state" {
  instance_id = aws_instance.my_existing_instance.id
  state = "stopped"
}