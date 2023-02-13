
# Create Security Group
resource "aws_security_group" "demo-web-sg" {
  name = "demo-web-sg"
  description = "Web and SSH"

  ingress {
    description = "Allow Port 80"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 443"
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 在生產環境中通常會只限定公司 IP 訪問
  ingress {
    description = "Allow Port 22"
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "demo-web-sg"
  }
}