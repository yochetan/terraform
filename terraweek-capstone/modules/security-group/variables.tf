
variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

variable "ingress_ports" {
  description = "TCP ports to allow inbound"
  type        = list(number)
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}
