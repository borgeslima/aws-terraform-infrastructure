terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "loyalty-aws-iac-dev"
    key    = "terraform.tfstate"
  }
}
