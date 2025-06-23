output "alarm_name" {
  description = "The name of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.ConsoleLoginSuccessesAlarm.alarm_name
}

output "alarm_arn" {
  description = "The ARN of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.ConsoleLoginSuccessesAlarm.arn
}