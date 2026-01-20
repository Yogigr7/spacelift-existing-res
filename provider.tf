terraform {
  required_version = "1.5.6"

  backend "s3" {
    bucket         = "test-rate-platform"
    dynamodb_table = "terraform-state-lock-test-platform"
    key            = "spacelift-testing-existing-res/testing-terraform-spacelift-testing.tfstate"
    region         = "us-east-1"
    # role_arn       = "arn:aws:iam::459772859073:role/test-platform-state-role"
    profile        = "test-platform-JuniorCPE"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "test-platform-JuniorCPE"
}