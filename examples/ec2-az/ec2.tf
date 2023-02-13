
resource "aws_instance" "demo-web-1a" {
  instance_type= var.instance_type_map["dev"]
  ami = data.aws_ami.latest_ami.id
  key_name = var.aws_key_pair

  vpc_security_group_ids = [aws_security_group.demo-web-sg.id]

  for_each = toset(data.aws_availability_zones.demo-azs.names)
  availability_zone = each.key

  tags = {
    Name = "demo-web-1a-${each.key}-${each.value}"
  }
}
