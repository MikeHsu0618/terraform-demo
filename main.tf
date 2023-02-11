module "ec2" {
  source = "./modules/ec2-output"
}

output "ec2-outputs" {
  value = module.ec2.instance_public_ip
}