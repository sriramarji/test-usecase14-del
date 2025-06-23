terraform {
  backend "s3" {
    bucket       = "tf-bucket-prod1"
    key          = "uc11-nginx/terraform.tfstate"
    region       = "us-east-1"
    #use_lockfile = true
    encrypt      = true
  }
}