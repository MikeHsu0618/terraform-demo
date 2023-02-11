# AWS public IP
output "instance_public_ip" {
  # ec2 公有 ip
  value = aws_instance.demo-web-1a.public_ip
}

output "instance_type" {
  # ec2 公有 ip
  value = aws_instance.demo-web-1a.instance_type
}

output "instance_type2" {
  # ec2 公有 ip
  value = aws_instance.demo-web-2a.instance_type
}