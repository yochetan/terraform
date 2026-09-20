output "table_names" {
  description = "Names of the provisioned DynamoDB tables"
  value       = aws_dynamodb_table.my_dynamodb_table[*].name
}

output "table_arns" {
  description = "ARNs of the provisioned DynamoDB tables"
  value       = aws_dynamodb_table.my_dynamodb_table[*].arn
}