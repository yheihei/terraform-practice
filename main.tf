# ----------------------------------
# Terraform configration
# ----------------------------------
terraform {
  required_version = ">=1.1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket  = "tastylog-tfstate-bucket-kokubo"
    key     = "tastylog-dev.tfstate" # 変数化できない
    region  = "ap-northeast-1"
    profile = "terraform" # IAMユーザー
  }
}

# ----------------------------------
# Provider
# ----------------------------------
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

# ----------------------------------
# Variables
# ----------------------------------
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain" {
  type = string
}
