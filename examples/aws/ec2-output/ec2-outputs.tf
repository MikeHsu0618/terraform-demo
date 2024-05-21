# AWS public IP
output "instance_public_ip" {
  # ec2 公有 ip
  value = aws_instance.demo-web-1a.public_ip
}