
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.11.5"

  name = "test-vpc"

  cidr = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  vpc_tags = {
    "Name" = "test-vpc"
  }
}