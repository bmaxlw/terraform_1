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
  region  = var.regions.us
  alias   = "us"
}

provider "aws" {
  profile = "default"
  region  = var.regions.eu
  alias   = "eu"
}