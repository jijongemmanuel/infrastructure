
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_instance" "this" {
  ami = "ami-08a52ddb321b32a8c"
  instance_type = "t2.micro"
  subnet_id  = "subnet-074b0427fd1e7e363"
  tags = {
    Name = "test_instance"
  }
}

resource "aws_sns_topic" "user_updates" {
  name = "terraform-sns-topic"
}

resource "aws_s3_bucket" "s3_state" {
   bucket = "terraform-state-13-08-2023"
}

resource "aws_dynamodb_table" "state_table" {
  name           = "test_dynamodb_table"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
      "Name" = "test_dynamodb_table"
    }
  
}