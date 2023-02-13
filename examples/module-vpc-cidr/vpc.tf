module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.5"

  # TF 名称
  name = "test-vpc"
  # IP 地址段
  cidr = "10.0.0.0/16"
  # 启用 DNS 主机
  enable_dns_hostnames = true
  # 启用 DNS 支持
  enable_dns_support = true

  vpc_tags = {
    # 赋予 tagName 标签
    "Name" = "${local.appName}-vpc-2022"
  }

  # 配置使用的 AZ 区
  azs = ["ap-northeast-1a", "ap-northeast-1c"]
  # 配置公有网段(会自动在路由表中配置IGW)
  public_subnets = ["10.0.10.0/24", "10.0.11.0/24"]
  # 配置私有网段
  private_subnets = ["10.0.20.0/24", "10.0.21.0/24"]
  # 公有网段 TagName
  public_subnet_tags = {
    "Name" = "${local.appName}-public-subnets"
  }
  # 私有网段 TagName
  private_subnet_tags = {
    "Name" = "${local.appName}-private-subnets"
  }

  database_subnets = ["10.0.30.0/24", "10.0.31.0/24"]
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnet_tags = {
    "Name" : "${local.appName}-database-subnets"
  }
}