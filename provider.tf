terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.50.0"
    }
  }
     backend "s3" {
       bucket = "raja-peta-cloud" #bucket name it should be crated maually before
        key    = "raja-peta"
        region = "us-east-1"
        dynamodb_table = "raja-locking" #locking
  } 
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}