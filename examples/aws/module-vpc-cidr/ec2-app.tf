module "ec2-app" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  count = 0

  name = "${local.appName}-app-${count.index + 1}"
  ami = var.instance_ami_id
  instance_type = var.instance_type
  key_name = var.instance_keypair

  subnet_id = module.vpc.private_subnets[count.index % length(module.vpc.private_subnets)]

  vpc_security_group_ids = [module.app_server_sg.security_group_id]

  tags = {
    "Name" : "${local.appName}-app-${count.index + 1}"
  }
}