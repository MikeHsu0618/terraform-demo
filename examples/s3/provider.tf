terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }

    # 空资源提供器
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
}

###########################################################
# 提供商设置(云平台)
provider "aws" {
  profile = "default"
  region  = var.aws_region
}
