output "error_rate_alarm_arn" {
  description = "ARN of the error rate alarm"
  value       = aws_cloudwatch_metric_alarm.high_error_rate.arn
}

output "latency_alarm_arn" {
  description = "ARN of the latency alarm"
  value       = aws_cloudwatch_metric_alarm.high_origin_latency.arn
}

output "log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.website_logs.name
}