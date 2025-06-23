module "s3" {
  source = "./modules/s3"
  cloudtrail_bucket_name  = var.cloudtrail_bucket_name 
}

module "sns" {
  source = "./modules/sns"
  sns_topic_name  = var.sns_topic_name
}

module "cloudwatch" {
  source                = "./modules/cloudwatch"
  sns_topic_arn         = [module.sns.sns_topic_arn]
  cloudtrail_name       = var.cloudtrail_name
  cloudtrail_bucket_name = var.cloudtrail_bucket_name

}