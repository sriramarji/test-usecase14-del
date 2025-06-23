resource "aws_cloudwatch_log_group" "cloudtrail" {
  name              = var.cloudtrail_log_group_name
#  retention_in_days = var.retention
}


resource "aws_cloudtrail" "main" {
  name                          = var.cloudtrail_name
  s3_bucket_name                = var.cloudtrail_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  cloud_watch_logs_group_arn    = "${aws_cloudwatch_log_group.cloudtrail.arn}:*"
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_role.arn

#   depends_on = [
#     aws_cloudwatch_log_group.cloudtrail,
#     aws_s3_bucket_policy.cloudtrail_bucket_policy
#   ]
}

resource "aws_iam_role" "cloudtrail_role" {
  name = "cloudtrail_cloudwatch_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "cloudtrail.amazonaws.com"
      },
      Effect = "Allow",
      Sid    = ""
    }]
  })
}

resource "aws_iam_role_policy" "cloudtrail_policy" {
  name = "cloudtrail-logs"
  role = aws_iam_role.cloudtrail_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "${aws_cloudwatch_log_group.cloudtrail.arn}:*"
      }
    ]
  })
}

/*resource "aws_cloudwatch_log_metric_filter" "ConsoleLoginFailures" {
  name           = "ConsoleLoginFailures"
  log_group_name = var.cloudtrail_log_group_name
  pattern        = "{ $.eventName = \"ConsoleLogin\" && $.responseElements.ConsoleLogin = \"Failure\" }"

  metric_transformation {
    name      = "ConsoleLoginFailures"
    namespace = "SecurityHub"
    value     = "1"
  }
  depends_on = [aws_cloudwatch_log_group.cloudtrail]
}*/

resource "aws_cloudwatch_log_metric_filter" "ConsoleLoginSuccesses" {
  name           = "ConsoleLoginSuccesses"
  log_group_name = var.cloudtrail_log_group_name
  pattern        = "{ $.eventName = \"ConsoleLogin\" && $.responseElements.ConsoleLogin = \"Success\" }"

  metric_transformation {
    name      = "ConsoleLoginSuccesses"
    namespace = "SecurityHub"
    value     = "1"
  }
  depends_on = [aws_cloudwatch_log_group.cloudtrail]
}

/*resource "aws_cloudwatch_metric_alarm" "ConsoleLoginFailuresAlarm" {
  alarm_name          = "ConsoleLoginFailuresAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "ConsoleLoginFailures"
  namespace           = "SecurityHub"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm for console login failures"
  alarm_actions       = var.sns_topic_arn
}*/


resource "aws_cloudwatch_metric_alarm" "ConsoleLoginSuccessesAlarm" {
  alarm_name          = "ConsoleLoginSuccessesAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "ConsoleLoginSuccesses"
  namespace           = "SecurityHub"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm for console login successes"
  alarm_actions       = var.sns_topic_arn
}