# Cortex Cloud AWS S3 Audit Logs Collector Integration (Assumed Role)

This Terraform configuration sets up AWS resources to ingest CloudTrail audit logs into Cortex Cloud using S3 Collector with the assumed role option.

## Files
- `provider.tf`: AWS provider configuration
- `main.tf`: S3 bucket, SQS queue, IAM role, and policies
- `variables.tf`: Variable definitions
- `terraform.tfvars.example`: Example variable values
- `outputs.tf`: Outputs for integration
- `.gitignore`: Prevents sensitive files from being committed

## Usage
1. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in your values.
2. Initialize Terraform:
   ```sh
   terraform init
   ```
3. Apply the configuration:
   ```sh
   terraform apply
   ```

## Required Variables
- `s3_bucket_name`: Name for the S3 bucket to store CloudTrail logs
- `sqs_queue_name`: Name for the SQS queue
- `role_name`: Name for the IAM role to be assumed by Cortex
- `cortex_account_id`: Cortex AWS Account ID for trust relationship
- `external_id`: External ID provided by Cortex

## AWS Account IDs for Cortex
- **Standard Cortex XDR Cloud**: Use Account ID `006742885340` for the trust relationship.
- **Cortex XDR FedRAMP Environment**: Use Account ID `685269782068` for the trust relationship.

When configuring the trust relationship in your IAM role, specify the appropriate Account ID based on your Cortex XDR environment.

## Outputs
- SQS URL
- SQS Name
- Role ARN
- External ID
- Log Type (static: Audit Logs)

## Security
- Do **not** commit your `terraform.tfvars` file with sensitive values.
- The `.gitignore` file is set to exclude it by default.
