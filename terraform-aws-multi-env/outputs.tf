output "ec2_instance_ids" {
  description = "IDs of the provisioned EC2 instances"
  value       = aws_instance.my_instance[*].id
}

output "s3_bucket_names" {
  description = "Names of the provisioned S3 buckets"
  value       = aws_s3_bucket.my-bucket[*].bucket
}

output "dynamodb_table_names" {
  description = "Names of the provisioned DynamoDB tables"
  value       = aws_dynamodb_table.my_dynamodb_table[*].name
}