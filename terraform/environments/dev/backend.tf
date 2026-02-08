terraform {
  backend "s3" {
    bucket = "spineproject-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}
