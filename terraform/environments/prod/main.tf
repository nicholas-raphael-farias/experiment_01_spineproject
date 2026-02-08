terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = "prod"
      ManagedBy   = "terraform"
    }
  }
}

data "aws_s3_bucket" "artifacts" {
  bucket = var.artifacts_bucket_name
}

module "ci_iam" {
  source = "../../modules/ci-iam"

  create_oidc_provider      = false
  existing_oidc_provider_arn = var.oidc_provider_arn
  role_name                 = "${var.project_name}-github-actions-prod"
  artifacts_bucket_arn      = data.aws_s3_bucket.artifacts.arn
  s3_prefix                 = "prod"

  github_sub_claims = [
    "repo:${var.github_repo}:ref:refs/tags/v*",
  ]

  tags = {
    Environment = "prod"
  }
}
