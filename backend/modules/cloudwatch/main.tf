resource "aws_cloudwatch_metric_alarm" "high_error_rate" {
  alarm_name          = "tasty-bites-high-error-rate"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "4xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = "300"
  statistic           = "Average"
  threshold           = "5"
  alarm_description   = "This metric monitors CloudFront 4xx error rate"

  dimensions = {
    DistributionId = var.distribution_id
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "high_origin_latency" {
  alarm_name          = "tasty-bites-high-origin-latency"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "OriginLatency"
  namespace           = "AWS/CloudFront"
  period              = "300"
  statistic           = "Average"
  threshold           = "3000"
  alarm_description   = "This metric monitors CloudFront origin latency"

  dimensions = {
    DistributionId = var.distribution_id
  }

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "website_logs" {
  name              = "/aws/cloudfront/tasty-bites"
  retention_in_days = 30

  tags = var.tags
}