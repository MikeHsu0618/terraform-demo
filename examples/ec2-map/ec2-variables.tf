# AWS Region
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "ap-northeast-1"
}

# AWS EC2 Instance Type
variable "instance_type_map" {
  description = "EC2 Instance Types"
  type = map(string)
  default = {
    prod : "t2.micro",
    dev : "t1.micro"
  }
}

# AWS EC2 Instance Image ID
variable "ami_id" {
  description = "AMI Image ID"
  type = string
  default = "ami-0218d08a1f9dac831"
}

# AWS Key Pair
variable "aws_key_pair" {
  description = "AWS Key Pair"
  type = string
  default = "test-ssh-key"
}

