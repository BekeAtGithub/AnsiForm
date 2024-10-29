# AWS Provider Configuration
provider "aws" {
  region = var.region
}

# Optional - Configure Backend for State Storage
terraform {
  backend "s3" {
    bucket = var.state_bucket_name
    key    = var.state_key
    region = var.region
  }
}
