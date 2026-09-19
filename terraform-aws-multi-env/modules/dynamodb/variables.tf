variable "dynamodb_table_name" {
  description = "This variable holds dynamodb table name"
  default = "damn-my-dynamodb-table"
  type = string
}

variable "env" {
  description = "This variable holds the environment"
  type = string
}

variable "dynamodb_table_count" {
  description = "This variable holds dynamo table count"
  type = number
}