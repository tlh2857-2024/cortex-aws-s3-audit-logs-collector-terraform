data "aws_iam_policy_document" "cortex_assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [var.cortex_account_id]
    }
    actions = ["sts:AssumeRole"]
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.external_id]
    }
  }
}

data "aws_iam_policy_document" "cortex_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = [
      aws_s3_bucket.cloudtrail_logs.arn,
      "${aws_s3_bucket.cloudtrail_logs.arn}/AWSLogs/11111/*",
      "${aws_s3_bucket.cloudtrail_logs.arn}/AWSLogs/22222/*"
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:GetQueueAttributes",
      "sqs:DeleteMessage"
    ]
    resources = [aws_sqs_queue.cloudtrail_queue.arn]
  }
}

resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = var.s3_bucket_name
}

resource "aws_sqs_queue" "cloudtrail_queue" {
  name = var.sqs_queue_name
}

resource "aws_iam_role" "cortex_assume_role" {
  name = var.role_name
  assume_role_policy = data.aws_iam_policy_document.cortex_assume_role_policy.json
}

resource "aws_iam_role_policy" "cortex_policy" {
  name = "CortexCloudTrailPolicy"
  role = aws_iam_role.cortex_assume_role.id
  policy = data.aws_iam_policy_document.cortex_policy.json
}




