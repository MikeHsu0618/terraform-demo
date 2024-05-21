#!/bin/bash

sudo yum update -y
sudo timedatectl set-timezone "Asia/Tokyo"
sudo localectl set-locale LANG=ja_JP.UTF-8
sudo touch /home/ec2-user/.hushlogin
sudo chown ec2-user:ec2-user /home/ec2-user/.hushlogin
sudo
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
sudo echo '<h1>Web Server - Terraform EC2.</h1>' | sudo tee /var/www/html/index.html