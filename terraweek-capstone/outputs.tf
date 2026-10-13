
output "environment" {
  description = "Current Terraform workspace"
  value       = local.environment
}

output "vpc_id" {
  description = "Created VPC ID"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "Created public subnet ID"
  value       = module.vpc.subnet_id
}

output "security_group_id" {
  description = "Created security group ID"
  value       = module.security_group.sg_id
}

output "instance_id" {
  description = "Created EC2 instance ID"
  value       = module.ec2_instance.instance_id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_instance.public_ip
}
