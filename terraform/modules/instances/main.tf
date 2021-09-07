resource "aws_instance" "app_server" {
  ami                         = var.instance_ami
  key_name                    = var.instance_key_name
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = true
  count                       = var.instance_count
  tags                        = var.tags

}

