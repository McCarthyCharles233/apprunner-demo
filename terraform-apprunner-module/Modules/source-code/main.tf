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

resource "aws_apprunner_service" "apprunner-demo" {
  service_name = "apprunner-demo"

  source_configuration {
    authentication_configuration {
      connection_arn = "arn:aws:apprunner:us-east-1:567940529223:connection/app-runner/b6f3c1fe02a94194bd684cf3204932eb"
    }
    code_repository {
      code_configuration {
        code_configuration_values {
          build_command = "pip install -requirement.txt"
          port          = "8080"
          runtime       = "PYTHON_3"
          start_command = "python app.py"
        }
        configuration_source = "REPOSITORY"
      }
      repository_url = "https://github.com/McCarthyCharles233/apprunner-demo"
      source_code_version {
        type  = "BRANCH"
        value = "main"
      }
    }
  }

  network_configuration {
    ingress_configuration {
      is_publicly_accessible = "true"
    }
  }

  tags = {
    Name = "apprunner-demo"
  }
}