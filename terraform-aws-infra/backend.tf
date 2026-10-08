terraform {
  backend "s3" {
    bucket         = "terraweek-state-chetan"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraweek-state-lock"
    encrypt        = true
  }
}