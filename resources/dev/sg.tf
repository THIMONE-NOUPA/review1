provider "aws" {
  region = "us-east-1"
}

## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "${var.common_tags["environment"]}-${var.common_tags["project"]}-${var.common_tags["owner"]}-tf-state"
    key            = "jenkins-master-sg/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "${var.common_tags["environment"]}-${var.common_tags["project"]}-${var.common_tags["owner"]}-tf-state-lock"
    encrypt        = true
  }
}


module "jenkins-sg" {
  source     = "../modules/sg"
  aws_region = "us-east-1"
  sg_name    = "jenkins-master"
  ingress_ports = [
    22,
    80,
    443,
    9000,
    8080
  ]
#   tags = {
#     "owner"          = "EKT"
#     "environment"    = "development"
#     "project"        = "spring"
#     "create_by"      = "Terraform"
#     "cloud_provider" = "aws"
#   }
}

locals {
  common_tags = {
    "id"             = "2024"
    "owner"          = "Thim"
    "environment"    = "development"
    "project"        = "spring"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "company"        = "EKT"
  }
}