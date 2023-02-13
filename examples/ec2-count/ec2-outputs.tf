# AWS public IP
output "instance_public_ip" {
  # ec2 公有 ip
  value = [for instance in aws_instance.demo-web-1a : instance.public_ip]

  # 另一種寫法
  #  value = aws_instance.demo-web-1a[*].public_ip
}

# 通過 map 輸出
output "instance_private_ip" {
  value = {for instance in aws_instance.demo-web-1a : instance.id => instance.private_ip}
}

output "instance_tagName" {
  value = {for instance in aws_instance.demo-web-1a : instance.id => lookup(instance.tags, "Name")}
}


output "instance_type" {
  # ec2 公有 ip
  value = aws_instance.demo-web-1a[*].instance_type
}
