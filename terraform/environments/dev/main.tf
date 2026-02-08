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
      Environment = "dev"
      ManagedBy   = "terraform"
    }
  }
}

module "artifacts_bucket" {
  source = "../../modules/artifacts-bucket"

  bucket_name = var.artifacts_bucket_name

  tags = {
    Environment = "dev"
  }
}

module "ci_iam" {
  source = "../../modules/ci-iam"

  create_oidc_provider = true
  role_name            = "${var.project_name}-github-actions-dev"
  artifacts_bucket_arn = module.artifacts_bucket.bucket_arn
  s3_prefix            = "dev"

  github_sub_claims = [
    "repo:${var.github_repo}:ref:refs/heads/development",
  ]

  tags = {
    Environment = "dev"
  }
}
