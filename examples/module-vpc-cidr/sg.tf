module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  name = "public-subnets-sg-web"

  # 設置 sg 所屬的 vpc
  vpc_id = module.vpc.vpc_id

  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = ["all-all"]

  tags = {
    "Name": "${local.appName}-public-subnets-sg-web"
  }
}

module "app_server_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  name = "private-subnets-sg-app"

  # 設置 sg 所屬的 vpc
  vpc_id = module.vpc.vpc_id

  ingress_rules = ["http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  egress_rules = ["all-all"]

  tags = {
    "Name": "${local.appName}-private-subnets-sg-web"
  }
}

module "db_server_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  name = "private-subnets-sg-db"

  # 設置 sg 所屬的 vpc
  vpc_id = module.vpc.vpc_id

  ingress_rules = ["mysql-tcp", "postgresql-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  egress_rules = ["all-all"]

  tags = {
    "Name": "${local.appName}-private-subnets-sg-db"
  }
}