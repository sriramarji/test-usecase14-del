module "cloudtrail" {
  source = "./modules/cloudtrail"

  cloudtrail_bucket_name  = var.cloudtrail_bucket_name
  cloudwatch_log_group_name = var.cloudwatch_log_group_name
  cloudtrail_name = var.cloudtrail_name
  log_group_name = module.cloudtrail.cloudtrail_log_group
}

module "sns" {
  source = "./modules/sns"
  sns_topic_name  = var.sns_topic_name
}

module "cloudwatch-alarm" {
  source                = "./modules/cloudwatch-alarm"
  sns_topic_arn         = [module.sns.sns_topic_arn]
}