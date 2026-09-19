# s3

resource "aws_s3_bucket" "remote-s3-bucket" {
  bucket = "chetan-remote-bucket"

  tags = {
    Name = "chetan-remote-bucket"
  }
}

# dynamodb

resource "aws_dynamodb_table" "remote-dynamodb-table" {
  name         = "chetan-remote-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "chetan-remote-dynamodb"
  }
}