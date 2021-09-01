variable "instance_ami" {
  description = "id of Amazon Machine Image to run on the instances"
  type        = string
  default     = "ami-01e7ca2ef94a0ae86"
}

variable "instance_name" {
  description = "Name tag for the ec2 instance"
  type        = string
  default     = "nginx instance"
}

variable "instance_type" {
  description = "Type of the instance to use e.g. t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "instance_key_name" {
  description = "Name of the ssh key used to log in to the instances"
  type        = string
  default     = "us-east-2_vlad"
}

variable "instance_count" {
  description = "The number of instances to be deployed"
  type        = number
  default     = 3
}

variable "ssh_key_private" {
  description = "Path to the private key used to access instances via ssh"
  type        = string
  default     = "~/.aws/us-east-2_vlad.pem"
}

variable "subnet_id" {
  description = "id of the vpc subnet to which the instances will be deployed"
  type        = string
}

variable "security_groups" {
  description = "IDs of security groups associated with instances"
  type        = list(string)
}

variable "tags" {
  description = "Tags to be associated with each instance"
  type        = map(any)
  default = {
    Name       = "nginx-server"
    created_by = "vlad"
  }
}

variable "jenkins_image" {
  description = "jenkins image to be run on the instance"
  type        = string
  default     = "jenkinsci/blueocean"
}
