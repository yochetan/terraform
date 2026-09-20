output "instance_ids" {
  description = "IDs of the provisioned EC2 instances"
  value       = aws_instance.my_instance[*].id
}

output "public_ips" {
  description = "Public IP addresses of the provisioned EC2 instances"
  value       = aws_instance.my_instance[*].public_ip
}

output "public_dns" {
  value = aws_instance.my_instance[*].public_dns
}