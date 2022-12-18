variable "region" {
    type = string
    default = "us-east-1"
}

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