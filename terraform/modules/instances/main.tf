resource "aws_instance" "app_server" {
  ami                         = var.instance_ami
  key_name                    = var.instance_key_name
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = true
  count                       = var.instance_count
  tags                        = var.tags


  # use remote-exec to ensure the instances are in running state before creating dependent resources
  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://get.docker.com | /bin/sh",
      "sudo docker run -d --rm --name jenkins -p 8080:8080 -p 50000:50000 -u 0 -v `pwd`:/var/jenkins_home  -v /var/run/docker.sock:/var/run/docker.sock ${var.jenkins_image}"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.ssh_key_private)
      host        = self.public_ip
    }
  }
}

