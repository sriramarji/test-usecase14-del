variable "cloudtrail_log_group_name" {
  description = "cloudtrail log group name"
  type = string
  default = "bayer-demo-cloudtrail-log-group"
}

variable "cloudtrail_name" {
  description = "Name of the cloudtrail"
  type = string
  default = "jp-demo-multi-region-trail"
}

variable "cloudtrail_bucket_name" {
  description = "Name of the s3 bucket"
  type = string
  default = "bayer-demo-cloudtrail-logs"
}



variable "sns_topic_arn" {
  description = "sns topic arn variable"
  type = list(string)
}