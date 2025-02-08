#!/bin/bash

# Create directories on control node
ssh -i ~/.ssh/my_first_key ec2-user@54.152.181.64 "mkdir -p ~/terraform-config ~/.aws"

# Copy terraform files
scp -i ~/.ssh/my_first_key \
    terraform/providers.tf \
    terraform/variables.tf \
    terraform/main.tf \
    terraform/outputs.tf \
    ec2-user@54.152.181.64:~/terraform-config/

# Copy AWS configuration files
scp -i ~/.ssh/my_first_key \
    aws-config \
    ec2-user@54.152.181.64:~/.aws/config

scp -i ~/.ssh/my_first_key \
    aws-credentials \
    ec2-user@54.152.181.64:~/.aws/credentials

# Set proper permissions for AWS credentials
ssh -i ~/.ssh/my_first_key ec2-user@54.152.181.64 "chmod 600 ~/.aws/credentials ~/.aws/config"

echo "Files and AWS configuration copied successfully!"
