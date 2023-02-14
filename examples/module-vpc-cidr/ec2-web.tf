module "ec2-web" {
  depends_on = [module.vpc]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  # 生成数量
  count = 3

  name          = "${local.appName}-webserver-${count.index + 1}"
  ami           = var.instance_ami_id
  instance_type = var.instance_type
  key_name      = var.instance_keypair

  #########################################################
  # 用户数据
  user_data = file("${path.module}/ec2-web-userdata.sh")

  # 指定网段生成
  subnet_id = module.vpc.public_subnets[count.index % length(module.vpc.public_subnets)]

  # 指定 Web 安全组
  vpc_security_group_ids = [module.web_server_sg.security_group_id]

  tags = {
    "Name" : "${local.appName}-webserver-${count.index + 1}"
  }
}