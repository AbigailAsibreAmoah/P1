output "website_url" {
  description = "CloudFront distribution URL"
  value       = module.cloudfront.distribution_domain_name
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3_website.bucket_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = module.cloudfront.distribution_id
}

output "waf_web_acl_id" {
  description = "WAF Web ACL ID"
  value       = module.waf.web_acl_id
}