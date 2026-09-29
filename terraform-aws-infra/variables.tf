variable "region" {
  description = "This variable holds region"
  default     = "us-west-2"
  type        = string
}

variable "vpc_cidr" {
  description = "This variable holds vpc cidr"
  default     = "10.0.0.0/16"
  type        = string
}

variable "subnet_cidr" {
  description = "This variable holds subnet cidr"
  default     = "10.0.1.0/24"
  type        = string
}

variable "instance_type" {
  description = "This variable holds ec2 instance type"
  default     = "t2.micro"
  type        = string
}

variable "project_name" {
  description = "This variable holds project name"
  type        = string
}

variable "environment" {
  description = "This variable holds environment"
  default     = "dev"
  type        = string
}

variable "allowed_ports" {
  description = "This variable holds allowed ports"
  default     = [22, 80, 443]
  type        = list(number)
}

variable "extra_tags" {
  description = "This variable holds vpc cidr"
  default     = {}
  type        = map(string)
}