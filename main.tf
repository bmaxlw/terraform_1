# General
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Providers
provider "aws" {
  profile = "default"
  region  = var.regions.us
  alias   = "us"
}

provider "aws" {
  profile = "default"
  region  = var.regions.eu
  alias   = "eu"
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

# VPC
module "vpc" {
  providers = { 
    aws = aws.eu
  }

  source = "terraform-aws-modules/vpc/aws"

  name = "app_vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}