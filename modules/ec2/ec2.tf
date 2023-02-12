terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "admin-cli"
  region  = "ap-northeast-1"
}

resource "aws_instance" "demo-web-1a" {
  instance_type="t2.micro"
  ami = "ami-0218d08a1f9dac831"

  tags = {
    Name = "demo-web-1a"
  }
}

