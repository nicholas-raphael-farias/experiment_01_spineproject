variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "artifacts_bucket_name" {
  description = "Name of the S3 artifacts bucket (created by dev environment)"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository in org/repo format"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the GitHub OIDC provider (from dev environment output)"
  type        = string
}
