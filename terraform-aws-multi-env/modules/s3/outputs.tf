output "bucket_names" {
  description = "Names of the provisioned S3 buckets"
  value       = aws_s3_bucket.my-bucket[*].bucket
}

output "bucket_arns" {
  description = "ARNs of the provisioned S3 buckets"
  value       = aws_s3_bucket.my-bucket[*].arn
}