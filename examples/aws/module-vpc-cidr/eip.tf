resource "aws_eip" "web_eip" {
  depends_on = [module.ec2-web, module.vpc]
  instance   = module.ec2-web[0].id
  vpc        = true
  tags = {
    "Name" : "${local.appName}-web_eip"
  }
}