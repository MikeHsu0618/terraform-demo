# Upload Files
resource "null_resource" "web-upload" {
  depends_on = [module.ec2-web]

  # 使用 ssh 連接到 ec2-web 主機
  connection {
    type = "ssh"
    host = module.ec2-web[0].public_ip
    user = "ec2-user"
    password = ""
    private_key = file("test-ssh-key.pem")
  }

  # 建立目錄
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /var/www/html",
      "sudo chown -R ec2-user:ec2-user /var/www/html"
    ]
  }

  # 上傳目錄
  provisioner "file" {
    source      = "web/"
    destination = "/var/www/html"
  }
}