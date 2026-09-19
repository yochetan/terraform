# the value can be changed in runtime / values are availble throughout the folder 

variable "ec2_instance_name" {
  description = "This variable holds EC2 instance name"
  default = "terra-automate-server"
  type = string
}

variable "ec2_volume_size" {
  description = "This variable holds EC2 volume size"
  default = 10
  type = number
}

variable "ec2_instance_state" {
  description = "This variable holds EC2 instance state"
  default = "stopped"
  type = string
}

variable "ec2_ami_id" {
  description = "This variable holds EC2 instance AMI ID"
  default = "ami-0d76b909de1a0595d"
  type = string
}

variable "ec2_instance_type" {
  description = "This variable holds EC2 instance type"
  default = "t3.micro"
  type = string
}

variable "ec2_instance_count" {
  description = "This variable holds EC2 instance count"
  type = number
}

variable "env" {
  description = "This variable holds the environment"
  type = string
}