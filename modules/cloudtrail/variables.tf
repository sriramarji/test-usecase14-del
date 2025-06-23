variable "cloudtrail_bucket_name" {
  description = "name of the s3 bucket"
  type = string
  #default = "demo-cloudtrail-latest-1997"
}


variable "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch Log Group for CloudTrail"
  type        = string
  default     = "/aws/cloudtrail/activity"
}


variable "cloudtrail_name" {
  description = "Name of the CloudTrail trail"
  type        = string
  default     = "demo-activity-trail"
}

variable "log_group_name" {
  type = string
}
