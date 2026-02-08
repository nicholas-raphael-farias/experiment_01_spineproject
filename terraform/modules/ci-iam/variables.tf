variable "create_oidc_provider" {
  description = "Whether to create the GitHub OIDC provider (true for first env, false for subsequent)"
  type        = bool
  default     = true
}

variable "existing_oidc_provider_arn" {
  description = "ARN of existing OIDC provider (required when create_oidc_provider is false)"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "Name of the IAM role for GitHub Actions"
  type        = string
}

variable "github_sub_claims" {
  description = "List of GitHub OIDC sub claims to allow (e.g. repo:org/repo:ref:refs/heads/main)"
  type        = list(string)
}

variable "artifacts_bucket_arn" {
  description = "ARN of the S3 artifacts bucket"
  type        = string
}

variable "s3_prefix" {
  description = "S3 key prefix this role can access (e.g. dev or prod)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
