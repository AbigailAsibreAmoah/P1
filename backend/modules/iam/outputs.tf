output "deploy_role_arn" {
  description = "ARN of the deployment role"
  value       = aws_iam_role.website_deploy.arn
}

output "deploy_policy_arn" {
  description = "ARN of the deployment policy"
  value       = aws_iam_policy.website_deploy.arn
}