# Require TF version to be same as or greater than 0.12.13
terraform {
  required_version = ">=1.2.2"
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region  = "eu-west-2"
  version = "~> 2.36.0"
}

# Call the seed_module to build our ADO seed info
module "bootstrap" {
  source                      = "../modules/bootstrap"
  name_of_s3_bucket           = "aws-lambda-terraform-example-tfstate"
  dynamo_db_table_name        = "aws-locks"
  iam_user_name               = "GitHubActionsIamUser"
  ado_iam_role_name           = "GitHubActionsIamRole"
  aws_iam_policy_permits_name = "GitHubActionsIamPolicyPermits"
  aws_iam_policy_assume_name  = "GitHubActionsIamPolicyAssume"
}
