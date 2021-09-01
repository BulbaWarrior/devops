resource "aws_s3_bucket" "terraform_state" {
  bucket = "bulbawarrior-devops-bucket"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

module "aws_network" {
  source   = "git::https://github.com/BulbaWarrior/terraform-nginx-servers.git//modules/network"
  vpc_cidr = var.vpc_cidr
  tags     = var.vpc_tags
}

module "instances" {
  source            = "./modules/instances"
  subnet_id         = module.aws_network.vpc_subnet.id
  security_groups   = [module.aws_network.security_group.id]
  instance_ami      = var.instance_ami
  tags              = var.instance_tags
  instance_type     = var.instance_type
  instance_key_name = var.instance_key_name
  instance_count    = var.instance_count
  ssh_key_private   = var.ssh_key_private
}
