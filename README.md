# Predict API – DevOps Assignment

This repository contains a simple API service deployed using AWS with a strong focus on practical DevOps fundamentals: containerization, CI/CD automation, infrastructure as code, monitoring, and security. The goal of this project is to demonstrate how a small service can be deployed and operated in a clean, production-like setup.

---

## Architecture Diagram

![Architecture Diagram](predict_api_architecture.png)

---

## Objective

The assignment focuses on:
- Containerizing a simple API service
- Automating build and deployment using CI/CD
- Deploying on AWS using managed services
- Implementing basic monitoring and alerting
- Following DevOps and security best practices

---

## Application Overview

The application is a minimal FastAPI service exposing two endpoints:

| Method | Endpoint   | Description              |
|------|------------|--------------------------|
| GET  | /health    | Health check endpoint    |
| GET  | /predict   | Returns a sample score   |

Example response:
```json
{
  "score": 0.75
}
```

---

## Architecture

High-level flow:

Client  
→ GitHub Actions (CI/CD)  
→ Amazon ECR (Docker image registry)  
→ Amazon ECS Fargate  
→ FastAPI container  
→ CloudWatch (logs, metrics, alarms)

Key services used:
- FastAPI for the API
- Docker for containerization
- Amazon ECS Fargate for running containers
- Terraform for infrastructure provisioning
- GitHub Actions for CI/CD
- CloudWatch for monitoring and logging

---

## CI/CD Pipeline

The CI/CD pipeline is implemented using GitHub Actions and is triggered on every push to the `main` branch.

### CI steps
- Checkout source code
- Build Docker image
- Authenticate to AWS using GitHub OIDC
- Push image to Amazon ECR

### CD steps
- Trigger a new ECS deployment
- ECS performs a rolling update with zero downtime

No AWS access keys are stored in GitHub. Authentication is handled using short‑lived credentials via OIDC.

---

## Deployment Strategy

- ECS Fargate service with desired count of 2 tasks
- Rolling deployment to ensure availability
- Terraform manages infrastructure only
- Application deployments are handled by CI/CD without re‑running Terraform

This keeps infrastructure changes and application releases clearly separated.

---

## Security Considerations

- IAM roles follow least‑privilege principles
- GitHub Actions uses OIDC instead of long‑lived credentials
- Container runs as a non‑root user
- No secrets are committed to the repository
- Networking is controlled using VPC subnets and security groups

---

## Monitoring and Observability

Monitoring is fully defined using Terraform.

### Logs
- Centralized logs using CloudWatch Logs
- Log retention configured

### Metrics
- ECS CPU utilization
- ECS memory utilization
- Running task count

### Dashboard
- CloudWatch dashboard showing CPU and memory usage

### Alerts
- High CPU usage alarm
- Alarm when running task count drops below expected

---

## Infrastructure as Code

All AWS resources are created using Terraform, including:
- ECS cluster and service
- Task definition
- ECR repository
- Networking (subnets and security groups)
- CloudWatch dashboards and alarms

This ensures the setup is repeatable and version‑controlled.

---

## How to Deploy

### Prerequisites
- AWS account
- AWS CLI configured locally
- Terraform installed
- GitHub repository with Actions enabled

### Steps
1. Provision infrastructure:
   ```bash
   terraform init
   terraform apply
   ```
2. Push code to the `main` branch
3. GitHub Actions builds and deploys the application automatically

---

## Submission Artifacts

The following screenshots are provided as part of the submission:
- Successful GitHub Actions workflow run
- ECS service with running tasks
- CloudWatch dashboard
- CloudWatch alarms

---

## Possible Improvements

- Add Application Load Balancer with HTTPS
- Blue/green deployments using CodeDeploy
- SNS notifications for alarms
- Image versioning using Git commit SHA
- Grafana dashboards

---

## Author

Kushagra
