terraform{
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

  defauldefault_tags {
    tags = {
      system = "xray-timeattack"
    }
  }  
}