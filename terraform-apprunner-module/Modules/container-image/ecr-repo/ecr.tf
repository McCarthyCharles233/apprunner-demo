terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "my-flask-app" {
  name                 = "my-flask-app" 
  image_tag_mutability = "INMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}