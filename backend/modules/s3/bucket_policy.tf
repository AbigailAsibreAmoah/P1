# Separate bucket policy resource to avoid circular dependencies
resource "aws_s3_bucket_policy" "website_policy_update" {
  count  = var.cloudfront_arn != "" ? 1 : 0
  bucket = aws_s3_bucket.website.id
  depends_on = [aws_s3_bucket_public_access_block.website]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowSpecificCloudFrontDistribution"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.website.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = var.cloudfront_arn
          }
        }
      }
    ]
  })
}

variable "cloudfront_arn" {
  description = "CloudFront distribution ARN for specific bucket policy"
  type        = string
  default     = ""
}