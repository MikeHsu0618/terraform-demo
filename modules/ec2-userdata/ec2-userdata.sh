#!/bin/bash
yum update -y
timedatectl set-timezone "Asia/Taipei"
localectl set-Locale LANG-ja_JP.UTF-8
touch /home/ec2-user/.hushLogin
chown ec2-user:ec2-user /home/ec2-user/.hushlogin

curl "https://awscli.amazonaws.com/awscli-exe-Linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip -d/tm/awscliv2/
/tmp/awscl.iv2/aws/install

curl -sL https://rpm.nodesource.com/setup_14.x | bash -
yum install -y gcc-c++ make
yum install -y nodejs
yum install -y httpd
systemctl enable httpd
service httpd start
sudo echo '<h1>TerraformEC2.</h1>'| sudotee /var/ww/html/index.html