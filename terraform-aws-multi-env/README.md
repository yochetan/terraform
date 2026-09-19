# Terraform AWS Multi-Environment Infrastructure

This project provisions AWS infrastructure across three environments — **dev**, **stg**, and **prd** — using a single, parameterized Terraform configuration. Each environment gets a different number of resources based on its scale requirements, driven by a `terraform.workspace` (or input variable) lookup rather than duplicated code per environment.

## Environment Resource Matrix

| Environment | EC2 Instances | S3 Buckets | DynamoDB Tables |
|-------------|:--------------:|:----------:|:----------------:|
| `dev`       | 2               | 1          | 1                |
| `stg`       | 3               | 1          | 1                |
| `prd`       | 4               | 2          | 2                |

## Project Structure

```
terraform-aws-multi-env/
├── main.tf            # Resource definitions (EC2, S3, DynamoDB)
├── variables.tf        # Input variables
├── outputs.tf          # Output values (instance IDs, bucket names, etc.)
├── providers.tf         # AWS provider configuration
└── README.md
```

## How It Works

Resource counts per environment are defined in a lookup map (in `variables.tf` or as `locals` in `main.tf`), for example:

```hcl
locals {
  env_config = {
    dev = { ec2_count = 2, s3_count = 1, dynamodb_count = 1 }
    stg = { ec2_count = 3, s3_count = 1, dynamodb_count = 1 }
    prd = { ec2_count = 4, s3_count = 2, dynamodb_count = 2 }
  }

  config = local.env_config[var.environment]
}
```

Resources then use `count` to scale up or down automatically:

```hcl
resource "aws_instance" "app" {
  count         = local.config.ec2_count
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "app-${var.environment}-${count.index}"
    Environment = var.environment
  }
}
```

The same pattern applies to the `aws_s3_bucket` and `aws_dynamodb_table` resources.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5
- An AWS account with configured credentials (`aws configure` or environment variables)
- An S3 bucket + DynamoDB table for remote state (recommended, not required for local testing)

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/yochetan/terraform.git
   cd terraform/terraform-aws-multi-env
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Select the environment you want to deploy by setting the `environment` variable:
   ```bash
   terraform plan -var="environment=dev"
   terraform apply -var="environment=dev"
   ```
   Swap `dev` for `stg` or `prd` to provision the other environments.

4. Destroy resources for an environment when no longer needed:
   ```bash
   terraform destroy -var="environment=dev"
   ```

## Variables

| Name          | Description                          | Type   | Default |
|---------------|---------------------------------------|--------|---------|
| `environment` | Target environment (`dev`, `stg`, `prd`) | string | `dev`   |
| `region`      | AWS region to deploy into            | string | `us-east-1` |
| `ami_id`      | AMI ID used for EC2 instances        | string | —       |
| `instance_type` | EC2 instance type                  | string | `t2.micro` |

*(Update this table to match the actual variables defined in `variables.tf`.)*

## Outputs

| Name              | Description                     |
|-------------------|----------------------------------|
| `ec2_instance_ids`| IDs of the provisioned EC2 instances |
| `s3_bucket_names` | Names of the provisioned S3 buckets |
| `dynamodb_table_names` | Names of the provisioned DynamoDB tables |

## Notes

- Each environment is isolated by the `environment` variable — no resources are shared across environments.
- Resource counts are centrally defined, so adding a new environment or changing scale only requires updating one lookup map.
- Consider using separate remote state files (or workspaces) per environment to avoid state collisions between `dev`, `stg`, and `prd`.

## License

MIT
