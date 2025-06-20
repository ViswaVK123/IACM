provider "aws" {
  region = var.awsregion
}

terraform {
  required_version = ">= 1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
  backend "s3" {
    bucket         = "viswakrishna1308"
    key            = "harness-IACM-ec2.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Viswakrishna-LocksLockID"
    encrypt        = true
  }
}
