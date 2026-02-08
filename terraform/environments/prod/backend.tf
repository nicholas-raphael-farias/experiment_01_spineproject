terraform {
  backend "s3" {
    bucket = "spineproject-terraform-state"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}
