
terraform {
 backend "s3" {
    dynamodb_table = "tfstate"
    bucket         = "tfstate-for-atlantis"
    encrypt        = true
    profile        = "personal"
    key            = "terraform.tfstate"
    region         = "us-east-2"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 1.6.1"
}
