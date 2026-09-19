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

variable "env" {
  description = "This variable holds the environment"
  default = "dev"
  type = string
}