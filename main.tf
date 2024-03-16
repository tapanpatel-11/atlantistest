#just a test
provider "aws" {
  region  = "us-east-2" 
  profile = "personal" 
}

# Define the AWS S3 bucket
resource "aws_s3_bucket" "atlantis" {
  bucket = "atlantis-data-random-bucket"
  tags = {
    app = "atlantis"
    env = "prod"
  }
}

