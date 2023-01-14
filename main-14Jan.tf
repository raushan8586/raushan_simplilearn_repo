terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  access_key = "**************"
  secret_key = "****************"
}

resource "aws_vpc" "simplilearn-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "simplilearn-vpc"
  }
}

resource "aws_subnet" "simplilearn-vpc" {
  vpc_id     = aws_vpc.simplilearn-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "simplilearn-Subnet1"
  }
}

resource "aws_internet_gateway" "simplilearn_gw" {
  vpc_id = aws_vpc.simplilearn-vpc.id

  tags = {
    Name = "simplilearn_gw"
  }
}
