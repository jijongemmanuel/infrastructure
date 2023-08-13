terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-state-13-08-2023"
    dynamodb_table = "test_dynamodb_table" 
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}