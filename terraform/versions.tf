terraform {
  required_version = ">= 0.14.0"
  # backend "s3" {
  #   bucket  = "vlados-chum-bucket"
  #   key     = "global/s3/terraform.tfstate"
  #   region  = "us-east-2"
  #   encrypt = true
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}
