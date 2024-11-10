# Apprunner-demo

AWS App Runner is a fully managed service that makes it easy to deploy and scale containerized web applications and APIs without needing to manage the underlying infrastructure. It supports two main deployment types: **Direct Source Deployment** and **Container Image Deployment**. 

- **Direct Source Deployment**: App Runner connects to source code repositories (e.g., GitHub), builds the container automatically, and deploys it.
- **Container Image Deployment**: App Runner deploys from container images stored in Amazon Elastic Container Registry (ECR) or other compatible registries.

Below I explore both deployment options and also use Infrastructure as Code (Terraform) to deploy an application on AWS App Runner.

# Architecture

![Project architecture diagram](/home/charles-mccarthy/Terraform-Module-AppRunner/architecture/arch-diagram.png)

