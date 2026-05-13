#!/bin/bash

set -e

# Move to Terraform directory to read outputs from the current state file
cd ../terraform

# Collect private IPs from Terraform outputs
HAPROXY_IP=$(terraform output -raw haproxy_private_ip)
NGINX_IP=$(terraform output -raw nginx_private_ip)
APACHE_IP=$(terraform output -raw apache_private_ip)

# Move to Ansible directory where inventory.ini should live
cd ../ansible

# Generate Ansible inventory from Terraform output values
cat > inventory.ini <<EOF
[haproxy]
haproxy01 ansible_host=${HAPROXY_IP}

[nginx]
nginx01 ansible_host=${NGINX_IP}

[apache]
apache01 ansible_host=${APACHE_IP}

[backend]
nginx01 ansible_host=${NGINX_IP}
apache01 ansible_host=${APACHE_IP}

[all:vars]
ansible_python_interpreter=/usr/bin/python3
EOF

echo "Inventory generated successfully: ansible/inventory.ini"