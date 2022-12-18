terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "app_server" {
  ami           = var.ec2_instance_ami
  instance_type = var.ec2_instance_type
  for_each      = var.ec2_instance_names

  tags = {
    Name = each.value
  }
}