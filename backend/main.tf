terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# S3 bucket for static website hosting
module "s3_website" {
  source = "./modules/s3"
  
  bucket_name = local.bucket_name
  tags        = var.tags
  cloudfront_distribution_id = module.cloudfront.distribution_id
}

# WAF Web ACL (must be created first)
module "waf" {
  source = "./modules/waf"
  
  tags = var.tags
}

# CloudFront distribution
module "cloudfront" {
  source = "./modules/cloudfront"
  
  bucket_name                = module.s3_website.bucket_name
  bucket_regional_domain_name = module.s3_website.bucket_regional_domain_name
  origin_access_control_id   = module.s3_website.origin_access_control_id
  web_acl_arn                = module.waf.web_acl_arn
  tags                       = var.tags
}

# IAM roles and policies
module "iam" {
  source = "./modules/iam"
  
  bucket_arn = module.s3_website.bucket_arn
  tags       = var.tags
}

# CloudWatch monitoring
module "cloudwatch" {
  source = "./modules/cloudwatch"
  
  distribution_id = module.cloudfront.distribution_id
  tags           = var.tags
}