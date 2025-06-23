output "cloudtrail_iam_role_arn" {
  description = "The ARN of the IAM role used by CloudTrail"
  value       = aws_iam_role.cloudtrail_role.arn
}

output "log_group_arn" {
  value = aws_cloudwatch_log_group.cloudtrail.arn
}

