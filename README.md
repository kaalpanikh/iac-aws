# Infrastructure as Code (IaC) with AWS and Ansible

This project demonstrates Infrastructure as Code (IaC) implementation using AWS, Terraform, and Ansible. It's based on the [roadmap.sh IaC project](https://roadmap.sh/projects/iac-digitalocean) but enhanced with additional features and AWS-specific implementations.

## Project Overview

This project sets up a complete web infrastructure using:
- **AWS** as the cloud provider
- **Terraform** for infrastructure provisioning
- **Ansible** for configuration management
- **Nginx** as the web server
- **Let's Encrypt** for SSL certificates

### Proof of Implementation
![Infrastructure as Code Implementation](images/iac.png)

### Architecture

The infrastructure consists of two main components:
1. **Control Node**: An Amazon Linux 2023 instance that manages the infrastructure
2. **Target Node**: An Ubuntu instance that hosts the web application

## Features and Enhancements

Beyond the original roadmap.sh project, we've added:
- AWS-specific security group configurations
- Domain management with Route53
- Automated SSL certificate management
- Enhanced security configurations
- Two-node architecture for better separation of concerns

## Directory Structure

```
iac-aws/
├── ansible/
│   └── configuration-management/
│       ├── roles/
│       │   ├── base/       # Base system configuration
│       │   ├── nginx/      # Nginx web server setup
│       │   ├── app/        # Application deployment
│       │   └── ssh/        # SSH security configuration
│       ├── inventory.ini   # Ansible inventory
│       └── setup.yml       # Main playbook
├── terraform/
│   ├── main.tf            # Main infrastructure configuration
│   ├── variables.tf       # Variable definitions
│   ├── outputs.tf         # Output definitions
│   └── providers.tf       # Provider configuration
├── aws-config             # AWS region configuration
└── copy-to-control.sh     # Utility script
```

## Implementation Details

### 1. Infrastructure Provisioning (Terraform)
- Creates a security group with necessary inbound rules
- Provisions an EC2 instance with Ubuntu
- Sets up necessary networking components

### 2. Configuration Management (Ansible)
- **Base Role**: System updates and basic security
- **Nginx Role**: Web server installation and configuration
- **App Role**: Static website deployment
- **SSH Role**: SSH hardening

### 3. Security Features
- Automated SSL certificate generation
- Secure headers configuration
- SSH hardening
- Security group restrictions

### 4. Deployment Process
1. Terraform creates the infrastructure
2. Ansible configures the servers
3. Application is deployed with SSL
4. Domain is configured to point to the server

## Key Improvements Over Base Project
1. **Two-Node Architecture**
   - Separate control and target nodes
   - Better security and management

2. **Enhanced Security**
   - AWS security groups
   - SSH hardening
   - Secure headers

3. **Automation**
   - Automated SSL certificate management
   - Streamlined deployment process

4. **AWS Integration**
   - Native AWS service utilization
   - AWS-specific security features

## Results
- A fully automated infrastructure setup
- Secure web server configuration
- SSL-enabled website
- Maintainable and scalable architecture

## Technologies Used
- AWS (EC2, Security Groups, Route53)
- Terraform v1.10.5
- Ansible
- Nginx
- Let's Encrypt
- Ubuntu 22.04 LTS
- Amazon Linux 2023

## Learning Outcomes
- Infrastructure as Code principles
- AWS infrastructure management
- Configuration management with Ansible
- Web server security best practices
- SSL certificate automation
- Domain management