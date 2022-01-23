/**
  * # README.md
  *
  * This module creates a S3 bucket and a EC2 instance with tags at local.common_tags.
  *
  * Before running aws-cli must be configured or the following vars must be exported.
  * ```
  * export AWS_ACCESS_KEY_ID=<access key id>
  * export AWS_SECRET_KEY_ID=<secret key id>
  * ```
  * 
  * Use the following commands to deploy infrastructure
  * ```
  * terraform init
  * terraform plan
  * terraform apply
  * ```
  * AWS region and ec2 instance-type can be passed as arguments with the flags `-var 'aws_region='` and `-var 'instance_type='`. By default, this parameters are set to `us-east-1` and `t3.micro`.
  */


terraform {
  required_version = ">= 0.11.7"
}

provider "aws" {
  region  = var.region
}

# Simple s3 bucket
resource "aws_s3_bucket" "s3" {
  bucket  = "flugel-s3"
  tags = local.common_tags
}

# Using latest default ubuntu AMI
data "aws_ami" "ami" {
  most_recent = true
  owners = ["099720109477"]

  filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}

# Simple EC2 instance
resource "aws_instance" "ec2" {
  ami                     = data.aws_ami.ami.id
  instance_type           = var.instance_type

  tags = local.common_tags
}