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
      image_identifier      = "567940529223.dkr.ecr.us-east-1.amazonaws.com/apprunner:latest"
      image_repository_type = "ECR_PUBLIC"
    }

    authentication_configuration {
      access_role_arn = "arn:aws:iam::567940529223:role/AppRunnerECR-Auth"
    }

    auto_deployments_enabled = false
  }


  tags = {
    Name = "apprunner-service"
  }

}

