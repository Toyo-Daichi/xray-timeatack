terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "personal"
  region = "ap-northeast-1"

  default_tags {
    tags = {
      system = "xray-timeattack"
    }
  }
}