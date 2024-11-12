terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


resource "aws_apprunner_service" "apprunner" {
  service_name = "apprunner-demo"

  source_configuration {
    image_repository {
      image_configuration {
        port = "8080"
      }
      image_identifier      = ""
      image_repository_type = "ECR_PUBLIC"
    }
    auto_deployments_enabled = true
  }

  tags = {
    Name = "apprunner-service"
  }
}