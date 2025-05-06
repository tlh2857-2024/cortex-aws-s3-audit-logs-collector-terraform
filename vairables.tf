variable "s3_bucket_name" {
  description = "Name for the S3 bucket to store CloudTrail logs."
  type        = string
}

variable "sqs_queue_name" {
  description = "Name for the SQS queue."
  type        = string
}

variable "role_name" {
  description = "Name for the IAM role to be assumed by Cortex."
  type        = string
}

variable "cortex_account_id" {
  description = "Cortex AWS Account ID for trust relationship."
  type        = string
}

variable "external_id" {
  description = "External ID provided by Cortex."
  type        = string
}