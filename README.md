# Apprunner-demo

AWS App Runner is a fully managed service that makes it easy to deploy and scale containerized web applications and APIs without needing to manage the underlying infrastructure. It supports two main deployment types: **Direct Source Deployment** and **Container Image Deployment**. 

- **Direct Source Deployment**: App Runner connects to source code repositories (e.g., GitHub), builds the container automatically, and deploys it.
- **Container Image Deployment**: App Runner deploys from container images stored in Amazon Elastic Container Registry (ECR) or other compatible registries.

Below I explore both deployment options and also use Infrastructure as Code (Terraform) to deploy an application on AWS App Runner.

# Architecture

![arch-diagram](https://github.com/user-attachments/assets/8e6cda40-0809-42c5-81c0-25799badb69d)


# Source Code Deployment

![Screenshot from 2024-11-07 16-03-07](https://github.com/user-attachments/assets/9aaae2a8-c7cd-48e0-a060-c6fefafeebc0)


When deploying with source code, App Runner connects to a GitHub repository through a secure integration. You can use an `apprunner.yaml` configuration file within your repository to define custom build and run settings, simplifying deployment automation. Alternatively, you can manually input these build and run commands directly in the AWS console, offering more flexibility and control over your deployment process. This approach automates container builds from the source, making deployment quick and reducing operational overhead.

![Screenshot from 2024-11-07 16-05-21](https://github.com/user-attachments/assets/34803e0a-2dbe-4441-80a7-27babee1ff7a)

**Manual Deployments**: In manual deployment mode, the user decides when to push changes live, giving full control over releases. App Runner won't deploy updates until a manual trigger is initiated. This is beneficial for testing and ensuring code quality before updates are made public. Users can make changes, review them, and deploy only when ready, creating a controlled workflow ideal for critical updates or staged rollouts.

**Automatic Deployments**: With automatic deployments, App Runner monitors the linked GitHub repository for changes and triggers deployments whenever new code is pushed. This setup leverages a built-in CI/CD pipeline that streamlines continuous delivery, ensuring that updates go live with minimal manual intervention. Developers benefit from faster feedback loops and reduced deployment time, which is perfect for agile development practices where rapid iteration and continuous improvement are essential.

![Screenshot from 2024-11-10 23-26-04](https://github.com/user-attachments/assets/db78ea32-6018-4017-9c5d-985f1a39983b)


**App Runner Event Logs**: AWS App Runner provides detailed event logs that track every stage of the deployment process, including build, deployment, and runtime events. These logs are essential for identifying and resolving issues as they offer real-time insights into what’s happening at each phase. Event logs help detect build failures, runtime errors, or configuration problems, making it easier to debug issues and ensure smoother deployments. By monitoring these logs, developers can quickly pinpoint and address errors, leading to more stable applications.

![Screenshot from 2024-11-07 16-07-09](https://github.com/user-attachments/assets/8b4b41fe-9a5e-4295-be24-f7bf07bd4471)
![Screenshot from 2024-11-09 01-50-43](https://github.com/user-attachments/assets/f8411374-420d-4e16-aa6e-94b038fcd9d6)


**Application URL**: After a successful deployment, App Runner automatically assigns a secure, HTTPS-enabled URL to the application. This URL allows immediate access to the deployed service, facilitating quick testing, sharing, and user interaction. The URL simplifies hosting by abstracting the infrastructure, enabling faster time-to-market without the need to set up custom domain configurations initially.

![Screenshot from 2024-11-09 02-28-12](https://github.com/user-attachments/assets/bc74736a-10f1-462e-bacd-62fd12047038)
![Screenshot from 2024-11-09 02-28-42](https://github.com/user-attachments/assets/d13c5656-23f4-47be-b16a-d6f255ccac4a)
![Screenshot from 2024-11-09 02-28-54](https://github.com/user-attachments/assets/1c003bd0-ba04-4403-9f92-47ac88c624a3)

