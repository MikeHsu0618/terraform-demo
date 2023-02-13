resource "aws_instance" "demo-web-1a" {
  instance_type="t2.micro"
  ami = "ami-06ee4e2261a4dc5c3"
  key_name = "demo-ssh-key"
  user_data = file("${path.module}/ec2-userdata.sh")

  tags = {
    Name = "demo-web-1a"
  }
}
