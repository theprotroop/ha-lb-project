# HAProxy High Availability Infrastructure with Terraform and Ansible

## Project Overview

This project provisions and configures a highly available web infrastructure using Terraform and Ansible on DigitalOcean.

The environment consists of:

- 1 HAProxy Load Balancer
- 1 Nginx Backend Server
- 1 Apache Backend Server
- Private VPC communication
- SSH key based authentication
- Automated server hardening
- Automated inventory generation
- HAProxy stats and metrics endpoint
- Infrastructure as Code implementation

---

# Architecture

```text
                        Internet
                            │
                            ▼
                 HAProxy Public IP :80/:443
                            │
                    Round Robin Load Balancer
                            │
             ┌──────────────┴──────────────┐
             ▼                             ▼
      Nginx Backend                  Apache Backend
        Private IP                     Private IP
             │                             │
             └────────── VPC ─────────────┘


                 Private/Internal Management

 Laptop
    │
SSH Tunnel
    │
    ▼
Control Machine (CM)
    │
    ├── Terraform
    ├── Ansible
    ├── SSH Keys
    └── Inventory Generation Script
            │
            ▼
     Private VPC Communication
            │
            ▼
 HAProxy Stats :8404/stats
 HAProxy Metrics :8404/metrics
```
## Technologies Used
- Terraform
- Ansible
- HAProxy
- Nginx
- Apache2
- DigitalOcean
- Ubuntu 22.04

# Features
## Infrastructure Automation

### Terraform provisions:

- VPC network
- HAProxy droplet
- Nginx droplet
- Apache droplet
- Firewall rules
- SSH key injection
- Configuration Management

### Ansible automates:

- Server hardening
- Automation user creation
- Passwordless sudo
- SSH key authentication
- Disabling root SSH access
- Nginx deployment
- Apache deployment
- HAProxy deployment
- Security Features
- SSH key authentication only
- Password authentication disabled
- Root SSH login disabled
- Private backend communication
- Restricted HAProxy stats access
- Firewall-based network segmentation

## Folder Structure
```
ha-lb-project/
├── terraform/
│   ├── providers.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── main.tf
│   ├── firewall.tf
│   ├── outputs.tf
│   
│
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.ini
│   ├── site.yml
│   │
│   ├── group_vars/
│   │   └── all/
│   │       └── vault.yml
│   │
│   └── roles/
│       ├── common/
│       ├── nginx/
│       ├── apache/
│       └── haproxy/
│
├── scripts/
│   └── generate_inventory.sh
│
├── .gitignore
└── README.md

```