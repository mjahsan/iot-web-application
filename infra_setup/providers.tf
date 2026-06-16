terraform {
    required_version = ">= 1.0.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.42"
        }
    }
    backend "s3" {
    bucket         = "landfill-dev-tf-state-storage-2026"
    key            = "development/terraform.tfstate"
    region         = "us-east-1" # Match your region
    dynamodb_table = "landfill-dev-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
    region = "us-east-1"
}
