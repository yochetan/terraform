variable "s3_bucket_name" {
  description = "This variable holds S3 bucket name"
  default = "damn-my-app-bucket"
  type = string
}

variable "env" {
  description = "This variable holds the environment"
  type = string
}

variable "s3_bucket_count" {
  description = "This variable holds bucket count"
  type = number
}