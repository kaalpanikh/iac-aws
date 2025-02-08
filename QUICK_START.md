# Quick Start Guide

This guide will help you set up and use this infrastructure project with your own AWS account and domain.

## Prerequisites

1. **AWS Account**
   - Active AWS account
   - IAM user with necessary permissions
   - AWS CLI installed locally

2. **Domain Name**
   - A registered domain name
   - Access to DNS management

3. **Local Tools**
   - Terraform installed
   - Git
   - SSH key pair

## Configuration Steps

### 1. AWS Setup

1. Create an IAM user with necessary permissions:
   - EC2 full access
   - Route53 full access
   - IAM role creation

2. Create AWS credentials file:
   ```ini
   [default]
   aws_access_key_id = YOUR_ACCESS_KEY_ID
   aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
   ```

3. Create AWS config file:
   ```ini
   [default]
   region = your-preferred-region
   output = json
   ```

### 2. SSH Keys

1. Create a new key pair in AWS EC2 console
2. Download the private key
3. Place it in `~/.ssh/` directory
4. Update permissions:
   ```bash
   chmod 400 ~/.ssh/your-key.pem
   ```

### 3. Update Configuration Files

#### Terraform Variables (`terraform/variables.tf`)
```hcl
variable "instance_type" {
  default = "t2.micro"  # or your preferred instance type
}

variable "key_name" {
  default = "your-key-pair-name"  # update this
}

variable "domain" {
  default = "your-domain.com"  # update this
}
```

#### Ansible Inventory (`ansible/configuration-management/inventory.ini`)
- After infrastructure creation, update with new IP addresses
- Update SSH key path

#### Nginx Configuration (`ansible/configuration-management/roles/nginx/templates/default-site.conf.j2`)
- Update server_name with your domain

### 4. Deployment Process

1. Initialize Terraform:
   ```bash
   cd terraform
   terraform init
   ```

2. Create infrastructure:
   ```bash
   terraform apply
   ```

3. Note the IP addresses from Terraform output

4. Update Ansible inventory with new IPs

5. Copy configurations to control node:
   ```bash
   ./copy-to-control.sh
   ```

6. Run Ansible playbook from control node:
   ```bash
   cd ansible-project
   ansible-playbook -i inventory.ini setup.yml
   ```

## Common Modifications

### Changing Instance Types
- Update `instance_type` in `variables.tf`
- Common choices:
  - t2.micro (free tier)
  - t2.small
  - t2.medium

### Different Regions
1. Update AWS config with new region
2. Update AMI IDs in Terraform (they vary by region)
3. Update availability zones in configuration

### Domain Changes
1. Update domain variable in `variables.tf`
2. Update Nginx configuration
3. Update SSL certificate configuration

### Different OS
1. Update AMI ID in Terraform
2. Modify Ansible roles for different package managers
3. Update user names in inventory

## Troubleshooting

### Common Issues

1. **SSH Connection Failed**
   - Check security group rules
   - Verify key pair permissions
   - Confirm instance is running

2. **SSL Certificate Failed**
   - Verify domain DNS settings
   - Check Nginx configuration
   - Ensure ports 80/443 are open

3. **Ansible Playbook Failed**
   - Check inventory IP addresses
   - Verify SSH key paths
   - Check Python installation on targets

### Useful Commands

```bash
# Check AWS credentials
aws sts get-caller-identity

# Test SSH connection
ssh -i ~/.ssh/your-key.pem user@ip-address

# Verify Nginx
systemctl status nginx

# Check SSL certificate
certbot certificates
```

## Security Notes

1. Never commit AWS credentials
2. Keep SSH keys secure
3. Regularly update security groups
4. Monitor AWS resources
5. Use least privilege principle for IAM users

## Cost Management

1. Use t2.micro instances for testing (free tier eligible)
2. Stop instances when not in use
3. Monitor AWS billing dashboard
4. Set up billing alerts
5. Clean up unused resources

## Support

For issues and questions:
1. Check the main README.md
2. Review AWS documentation
3. Consult Terraform and Ansible docs
4. Create issues in the repository
