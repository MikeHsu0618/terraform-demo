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
  region  = var.aws_region
}

resource "aws_instance" "demo-web-1a" {
  instance_type= var.instance_type
  ami = var.ami_id
  key_name = var.aws_key_pair

  vpc_security_group_ids = [aws_security_group.demo-web-sg.id]

  tags = {
    Name = "demo-web-1a"
  }
}

