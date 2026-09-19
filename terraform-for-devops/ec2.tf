# private scope which doesn't change in runtime 

locals {
  ec2_key_name = var.env == "dev" ? "terra-automate-key" : "terra-automate-key-prod"
}

# Key Value pair

resource aws_key_pair my_key_pair {

key_name=local.ec2_key_name
public_key=file("terra-automate-key.pub")
} 

# VPC Default

resource aws_default_vpc default {
}

# Security Group 

resource aws_security_group my_security_group {

name="terra-security-group"
vpc_id= aws_default_vpc.default.id  # interpolation
description = "this is Inbound and outbound rules for your instance Security group"

}

# Inbound & Outbount port rules



resource aws_vpc_security_group_ingress_rule allow_http {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource aws_vpc_security_group_ingress_rule allow_ssh {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource aws_vpc_security_group_egress_rule allow_all_traffic {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


# EC2 instance


resource aws_instance my_instance {

	ami = "ami-0d76b909de1a0595d" # OS AMI ID

	instance_type = "t3.micro" # Instance Type

	key_name = aws_key_pair.my_key_pair.key_name	# Key pair

	vpc_security_group_ids = [aws_security_group.my_security_group.id] # VPC & Security Group
	
	# root storage (EBS)
	root_block_device {
		volume_size = var.ec2_volume_size
		volume_type = "gp3"
	}

	tags = {
    Name = var.ec2_instance_name
  }
}

resource "aws_ec2_instance_state" "my_instance_state" {
  instance_id = aws_instance.my_instance.id
  state = var.ec2_instance_state
}
