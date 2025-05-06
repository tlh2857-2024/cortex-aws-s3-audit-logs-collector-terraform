output "sqs_url" {
  description = "URL of the SQS queue."
  value       = aws_sqs_queue.cloudtrail_queue.url
}

output "sqs_name" {
  description = "Name of the SQS queue."
  value       = aws_sqs_queue.cloudtrail_queue.name
}

output "role_arn" {
  description = "ARN of the IAM role to be assumed by Cortex."
  value       = aws_iam_role.cortex_assume_role.arn
}

output "external_id" {
  description = "External ID for the trust relationship."
  value       = var.external_id
}

output "log_type" {
  description = "Log type (static: Audit Logs)."
  value       = "Audit Logs"
}
