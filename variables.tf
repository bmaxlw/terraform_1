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
        "ec2_instance_dev",
        "ec2_instance_qa",
        "ec2_instance_prod"
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
        dev  = "s3_bucket_dev"
        qa   = "s3_bucket_qa"
        prod = "s3_bucket_prod"
    }
}