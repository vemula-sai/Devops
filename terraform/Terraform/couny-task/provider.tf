terraform {
    required_version = ">= 1.0.0"
    required_providers {
      aws = {
        version = ">= 4.57.0"
        source = "hashicorp/aws"
      }
    }
}

provider "aws" {
    region = "us-east-1"
  
}