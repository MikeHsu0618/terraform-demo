# AWS EC2 AMI Latest
data "aws_ami"  "latest_ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# AWS EC2 取得可用的所有區域
data "aws_availability_zones" "demo-azs" {
  filter {
    # 區域狀態
    name   = "opt-in-status"

    # opt-in-not-required: 已啟用區域
    # not-opt-in: 未啟用區域
    # opt-in: 啟用選擇加入的區域
    values = ["opt-in-not-required"]
  }
}