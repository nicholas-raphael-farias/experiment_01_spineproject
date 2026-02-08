output "github_actions_role_arn" {
  description = "ARN of the GitHub Actions IAM role for prod"
  value       = module.ci_iam.role_arn
}
