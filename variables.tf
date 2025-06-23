variable "cloudtrail_bucket_name" {
  description = "name of the s3 bucket"
  type = string
  default = "demo-cloudtrail-latest-1997"
}

variable "cloudtrail_log_group_name" {
  description = "cloudtrail log group name"
  type = string
  default = "demo-cloudtrail-logs-1997"
}

variable "sns_topic_name" {
  description = "SNS topic name"
  type = string
  default = "custom-metric-topic"
}

variable "cloudtrail_name" {
  description = "Name of the cloudtrail"
  type = string
  default = "demo-cloudtrail"
}