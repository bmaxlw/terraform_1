# General
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

# EC2 Instances
resource "aws_instance" "app_server" {
  ami           = var.ec2_instance_ami
  instance_type = var.ec2_instance_type
  for_each      = var.ec2_instance_names

  tags = {
    Name = each.value
  }
}

# S3 Buckets
resource "aws_s3_bucket" "app_bucket" {
  for_each      = var.s3_buckets_names
  bucket_prefix = "${each.key}-"
  tags = {
    Name        = each.value
    Environment = each.key
  }
}