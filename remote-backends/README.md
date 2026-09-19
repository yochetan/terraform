# Remote Backend For Terraform State (AWS)

- S3 Bucket
- DynamoDB Table

# OpenTF/Terraform (in recent updates) has simplified native state locking for S3 backends by utilizing S3 native lockfiles instead of requiring a separate Amazon DynamoDB table.

the dynamodb_table argument with use_lockfile = true in your Terraform configuration block.