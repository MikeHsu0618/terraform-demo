module "alb_web_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"
  name    = "public-subnets-sg-albweb"

  # 设置安全组所属VPC
  vpc_id = module.vpc.vpc_id

  # 入口规则
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # 出口规则
  egress_rules = ["all-all"]

  tags = {
    "Name" : "${local.appName}-public-subnets-sg-albweb"
  }
}

module "alb-web" {
  depends_on = [module.vpc, module.ec2-web]

  source  = "terraform-aws-modules/alb/aws"
  version = "6.6.1"

  name               = "${local.appName}-alb-web"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
  security_groups    = [module.alb_web_sg.security_group_id]

  target_groups = [
    {
      name_prefix      = "web-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = module.ec2-web[0].id
          port      = 80
        },
        {
          target_id = module.ec2-web[1].id
          port      = 80
        }
      ]
      tags = {
        "Name" = "${local.appName}-alb-target-group"
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    "Name" = "${local.appName}-alb"
  }
}