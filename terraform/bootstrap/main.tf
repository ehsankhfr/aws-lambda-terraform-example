# Require TF version to be same as or greater than 0.12.13
terraform {
  required_version = ">=1.2.2"
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region  = "eu-west-2"
  version = "~> 2.36.0"
}