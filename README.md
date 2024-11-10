# Apprunner-demo

AWS App Runner is a fully managed service that makes it easy to deploy and scale containerized web applications and APIs without needing to manage the underlying infrastructure. It supports two main deployment types: **Direct Source Deployment** and **Container Image Deployment**. 

- **Direct Source Deployment**: App Runner connects to source code repositories (e.g., GitHub), builds the container automatically, and deploys it.
- **Container Image Deployment**: App Runner deploys from container images stored in Amazon Elastic Container Registry (ECR) or other compatible registries.

Below I explore both deployment options and also use Infrastructure as Code (Terraform) to deploy an application on AWS App Runner.

# Architecture

![arch-diagram](https://github.com/user-attachments/assets/8e6cda40-0809-42c5-81c0-25799badb69d)


# Source Code Deployment

When deploying with source code, App Runner connects to a GitHub repository through a secure integration. You can use an `apprunner.yaml` configuration file within your repository to define custom build and run settings, simplifying deployment automation. Alternatively, you can manually input these build and run commands directly in the AWS console, offering more flexibility and control over your deployment process. This approach automates container builds from the source, making deployment quick and reducing operational overhead.

**Manual Deployments**: In manual deployment mode, the user decides when to push changes live, giving full control over releases. App Runner won't deploy updates until a manual trigger is initiated. This is beneficial for testing and ensuring code quality before updates are made public. Users can make changes, review them, and deploy only when ready, creating a controlled workflow ideal for critical updates or staged rollouts.

**Automatic Deployments**: With automatic deployments, App Runner monitors the linked GitHub repository for changes and triggers deployments whenever new code is pushed. This setup leverages a built-in CI/CD pipeline that streamlines continuous delivery, ensuring that updates go live with minimal manual intervention. Developers benefit from faster feedback loops and reduced deployment time, which is perfect for agile development practices where rapid iteration and continuous improvement are essential.