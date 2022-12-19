resource "aws_s3_bucket" "app_bucket" {
  for_each      = var.s3_buckets_names
  bucket_prefix = "${each.key}-"
  tags = {
    Name        = each.value
    Environment = each.key
  }
}

resource "aws_instance" "app_server" {
  ami           = var.ec2_instance_ami
  instance_type = var.ec2_instance_type
  for_each      = var.ec2_instance_names

  tags = {
    Name = each.value
  }
}