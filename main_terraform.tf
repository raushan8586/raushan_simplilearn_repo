terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"

}

# Create a VPC
resource "aws_vpc" "simplilearn-VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
        Name = "simplilearn-VPC"
  }
}

# Create Subnet

resource "aws_subnet" "simplilearn-Subnet1" {
    vpc_id = aws_vpc.simplilearn-VPC.id
    cidr_block = "10.0.0.0/24"

    tags = {
        Name = "simplilearn-Subnet1"
    }
}

# Create Internet Gateway

resource "aws_internet_gateway" "simplilearn-IntGW" {
    vpc_id = aws_vpc.simplilearn-VPC.id

    tags = {
        Name = "simplilearn-IntGW"
    }
}

resource "aws_security_group" "simplilearn-sg" {
  name        = "simplilearn-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.simplilearn-VPC.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "simplilearn-sg"
  }
}
