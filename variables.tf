# General
variable "region" {
    type = string
    default = "us-east-1"
}

# EC2 Instances
variable "ec2_instance_names" {
    description = "Names of EC2 instances"
    type = set(string)
    default = [
        "ec2-instance-dev",
        "ec2-instance-qa",
        "ec2-instance-prod"
    ]
}

variable "ec2_instance_ami" {
    description = "Amazon Linux 64-bit (x86)"
    type = string
    default = "ami-0b5eea76982371e91"
}

variable "ec2_instance_type" {
    type = string
    default = "t2.micro"
}

# S3 Buckets
variable "s3_buckets_names" {
    description = "Names of S3 buckets"
    type = map(string)
    default = {
        dev  = "s3-bucket-dev"
        qa   = "s3-bucket-qa"
        prod = "s3-bucket-prod"
    }
}