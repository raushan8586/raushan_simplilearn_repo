terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.37.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "Use your own access key"
  secret_key = "use your own secret key"
}

# create a VPC
resource "aws_vpc" "simplilearn-vpc1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "simplilearn-vpc1"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "simplilearn-bucket3-29th-oct"

  tags = {
    Name        = "simplilearn-bucket3-29th-oct"
    Environment = "Dev"
  }
}
