provider "aws" {
  region = var.awsregion
}

terraform {
  required_version = ">= 1.7.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
  backend "s3" {
    bucket         = "viswavk1308"
    key            = "Ansible.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ViswaBuddi-Locks"
    encrypt        = true
  }
}
