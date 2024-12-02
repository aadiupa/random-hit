terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "random-hit5"
    region = "ca-central-1"
   # dynamodb_table = "demo-table"
  }
}

provider "aws" {
  region = "ca-central-1"
}

locals {
  instance_size = var.instance_size == "small" ? "t2.micro" : 
                  var.instance_size == "medium" ? "t3.medium" : 
                  var.instance_size == "large" ? "c5.xlarge" : 
                  ""
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = var.instance_name

  instance_type          = local.instance_size
  subnet_id              = "subnet-0e0a88283f99218b9"

  tags = {
    Environment = "dev"
  }
}
