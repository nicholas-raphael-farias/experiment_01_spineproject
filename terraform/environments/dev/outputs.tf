output "artifacts_bucket_name" {
  description = "Name of the artifacts S3 bucket"
  value       = module.artifacts_bucket.bucket_name
}

output "artifacts_bucket_arn" {
  description = "ARN of the artifacts S3 bucket"
  value       = module.artifacts_bucket.bucket_arn
}

output "github_actions_role_arn" {
  description = "ARN of the GitHub Actions IAM role for dev"
  value       = module.ci_iam.role_arn
}

output "oidc_provider_arn" {
  description = "ARN of the GitHub OIDC provider (needed for prod env)"
  value       = module.ci_iam.oidc_provider_arn
}
