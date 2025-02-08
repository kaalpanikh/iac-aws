#!/bin/bash

# Copy the entire configuration-management directory to the control node
scp -i ~/.ssh/my_first_key -r \
    ansible/configuration-management/* \
    ec2-user@54.152.181.64:~/ansible-project/

echo "Ansible configuration files copied successfully!"
