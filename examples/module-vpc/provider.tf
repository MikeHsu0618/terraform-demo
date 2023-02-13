###########################################################
# 提供商设置(云平台)
provider "aws" {
  profile = "default"
  region  = var.aws_region
}
