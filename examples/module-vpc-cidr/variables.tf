# AWS Region
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  type = string
  default = "t1.micro"
}

# AWS EC2 Image ID
variable "instance_ami_id" {
  description = "AMI Image ID"
  type = string
  default = "ami-0218d08a1f9dac831"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  type = string
  default = "test-ssh-key"
}