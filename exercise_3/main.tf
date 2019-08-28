provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

terraform {
   backend "s3" {
   bucket = "rc-tf-bucket-training-exersize-1-michael2"
   key = "terraform.tfstate"
   region = "us-east-1"
  }
}

resource "aws_s3_bucket" "rc-tf-bucket-training-exersize-1-michael2" {
  bucket = "${var.s3_bucket_name}"
  acl = "private"
  region = "${var.s3_bucket_region}"
  
  versioning {
    enabled = true
  }
  
  tags = {
    Name        = "${var.s3_bucket_name}"
    Environment = "${var.tag_env}"
  }
}
