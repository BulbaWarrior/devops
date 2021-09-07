variable "vpc_cidr" {
  description = "cidr block of the vpc"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vpc_tags" {
  description = "Tags to be asscociated with every network component"
  type        = map(any)
  default = {
    created_by = "bulbawarrior"
    project    = "devops"
  }
}

variable "instance_tags" {
  description = "aws tags to be associated with instances"
  type        = map(any)
  default = {
    Name       = "nginx-server"
    created_by = "bulbawarrior"
    project    = "devops"
  }
}

variable "instance_type" {
  description = "Type of the instance to use e.g. t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "instance_key_name" {
  description = "Name of the ssh key used to log in to the instances"
  type        = string
  default     = "MyKey"
}

variable "instance_count" {
  description = "The number of instances to be deployed"
  type        = number
  default     = 1
}

variable "instance_ami" {
  description = "id of Amazon Machine Image to run on the instances"
  type        = string
  default     = "ami-01e7ca2ef94a0ae86"
}

variable "ssh_key_private" {
  description = "Path to the private key used to access instances via ssh"
  type        = string
  default     = "~/.ssh/MyKey.pem"
}
