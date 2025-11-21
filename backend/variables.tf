variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name for the website (leave empty for auto-generated unique name)"
  type        = string
  default     = ""
  validation {
    condition     = var.bucket_name == "" || can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.bucket_name))
    error_message = "Bucket name must be lowercase, contain only letters, numbers, and hyphens, and be globally unique."
  }
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Project     = "TastyBites"
    Environment = "production"
    Owner       = "WebTeam"
  }
}