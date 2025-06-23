output "cloudtrail_bucket_name" {
  value = aws_s3_bucket.cloudtrail_bucket.bucket
}

output "cloudtrail_log_group" {
  value = aws_cloudwatch_log_group.mytrail.name
}

output "cloudtrail_role_arn" {
  value = aws_iam_role.cloudtrail_role.arn
}

output "log_metric_filter_name" {
  description = "Name of the CloudWatch log metric filter"
  value       = aws_cloudwatch_log_metric_filter.login_filter.name
}

output "log_metric_filter_pattern" {
  description = "Pattern used to match log events"
  value       = aws_cloudwatch_log_metric_filter.login_filter.pattern
}

output "log_metric_filter_log_group" {
  description = "The log group this filter is associated with"
  value       = aws_cloudwatch_log_metric_filter.login_filter.log_group_name
}