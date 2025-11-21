variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket"
  type        = string
}

variable "origin_access_control_id" {
  description = "Origin Access Control ID"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "web_acl_arn" {
  description = "WAF Web ACL ARN"
  type        = string
  default     = ""
}